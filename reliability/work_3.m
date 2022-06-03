clear;clc;
i=10000000;
x1=unifrnd(0,100,1,i);
x2=exprnd(12.5,1,i);
z=x1-x2;
sigma=std(z);
miu=mean(z);
beta=miu/sigma;
k=0;j=1;
while j<=i
    if z(j)<0
        k=k+1;end
    j=j+1;
end
P=k/i;