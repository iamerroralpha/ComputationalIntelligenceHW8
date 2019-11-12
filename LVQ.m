x = [-1 0 1 0 -0.5 0.5];
y = [0 1 0 -1 0.5 -0.5];
c = [0 0 0 0 1 1];
scatter(x(1:4),y(1:4),'ro')
hold on
scatter(x(5:6),y(5:6),'bo')

n1 = [rand rand];
n2 = [rand rand];
a = 0.5;
N1 = n1;
N2 = n2;

for i = 1 : 1000
   
    for j = 1:length(x)
        d1 = sqrt((x(j)-n1(1))^2+(y(j)-n1(2))^2);
        d2 = sqrt((x(j)-n2(1))^2+(y(j)-n2(2))^2);
        d = [d1,d2];
        
        if min(d) == d1
            if c(j) ==0
            n1(1) = n1(1) + a*(x(j)-n1(1));
            n1(2) = n1(2) + a*(y(j)-n1(2));
            N1 = [N1; n1];
            end
        end
        if min(d) == d2
            if c(j) ==1
            n2(1) = n2(1) + a*(x(j)-n2(1));
            n2(2) = n2(2) + a*(y(j)-n2(2));
            N2 = [N2; n2];
            end
        end
        
    end 
    
end

hold on
scatter(N1(:,1),N1(:,2),'r*')
scatter(N2(:,1),N2(:,2),'b*')
title('LVQ network for a non linear classification problem')