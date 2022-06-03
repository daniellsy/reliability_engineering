clear;
clc;
%define the parametre and initial variable quantity
syms x y;
f=x-y;
gradient=jacobian(f,[x,y])%求梯度
%初始设计点
r(1)=70;s(1)=70;i=1;q=100;
while(q>0.001)
cdfr=unifcdf(r(i),0,100);
pdfr=unifpdf(r(i),0,100);
ncr=norminv(cdfr);
sigmar1=normpdf(ncr)/ pdfr;
miur1=r(i)-ncr*sigmar1;
cdfs=expcdf(s(i),12.5);
pdfs=exppdf(s(i),12.5);
ncs=norminv(cdfs);
sigmas=normpdf(ncs)/ pdfs;
mius=s(i)-ncs*sigmas;
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
