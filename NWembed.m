function y=NWembed(U, m, x, eta)
[Nv,Nc]=size(U);
s=zeros(Nc, 1);
for i=1:Nc
    s(i)=(eta*(-1)^m(i)*sign(U(:,i)'*x)-1)*(U(:,i)'*x);
end
y=x+U*s;
% y=x-U*(U'*x)+U*s;