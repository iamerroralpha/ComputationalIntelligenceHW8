n1 = [rand rand];
n2 = [rand rand];
n3 = [rand rand];
a = 0.5;
N1 = n1;
N2 = n2;
N3 = n3;

for i = 1 : 1000
   
    for j = 1:length(ds(:,1))
        d1 = sqrt((ds(j,1)-n1(1))^2+(ds(j,2)-n1(2))^2);
        d2 = sqrt((ds(j,1)-n2(1))^2+(ds(j,2)-n2(2))^2);
        d3 = sqrt((ds(j,1)-n3(1))^2+(ds(j,2)-n3(2))^2);
        d = [d1,d2,d3];
        
        if min(d) == d1
            n1(1) = n1(1) + a*(ds(j,1)-n1(1));
            n1(2) = n1(2) + a*(ds(j,2)-n1(2));
            N1 = [N1; n1];
        end
        if min(d) == d2
            n2(1) = n2(1) + a*(ds(j,1)-n2(1));
            n2(2) = n2(2) + a*(ds(j,2)-n2(2));
            N2 = [N2; n2];
        end
        if min(d) == d3
            n3(1) = n3(1) + a*(ds(j,1)-n3(1));
            n3(2) = n3(2) + a*(ds(j,2)-n3(2));
            N3 = [N3; n3];
        end
        
    end 
    
end
scatter(ds(:,1),ds(:,2))
hold on
scatter(N1(:,1),N1(:,2),'r*')
scatter(N2(:,1),N2(:,2),'b*')
scatter(N3(:,1),N3(:,2),'k*')
title('Kohonen network with 3 neurons')