clear;
clc;
%define the parametre and initial variable quantity
miur=200;
vr=0.12;
mius=100;
vs=0.15; 
sigmas=mius*vs;
syms x y;
f=x-y;
gradient=jacobian(f,[x,y])%求梯度
sLn=sqrt(log(1+vr^2));mLn=log(miur/(1+vr^2)^0.5);
%初始设计点
r(1)=miur;s(1)=mius;i=1;q=100;
while(q>0.001)
cdfX=logncdf(r(i),mLn,sLn);
pdfX=lognpdf(r(i),mLn,sLn);
nc=norminv(cdfX);
sigmar1=normpdf(nc)/ pdfX;
miur1=r(i)-nc*sigmar1;
x=r(i);y=s(i);
tiduzhi=eval(gradient);
lambdar=-tiduzhi(1)*sigmar1/(sigmar1^2+sigmas^2)^0.5;
lambdas=-tiduzhi(2)*sigmas/(sigmar1^2+sigmas^2)^0.5;
beta(i)=(mius-miur1)/(sigmar1*lambdar-sigmas*lambdas);
r(i+1)=miur1+sigmar1*lambdar*beta(i);
s(i+1)=mius+sigmas*lambdas*beta(i);
q=abs(r(i+1)-r(i));
i=i+1;
end

