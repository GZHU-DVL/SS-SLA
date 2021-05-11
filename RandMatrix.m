%function I=RandMatrix()
n1=1000;
n2=1000;
n=200;
for i=1:n
    h=round((n1-1)*rand(1)+1);
    l=round((n2-1)*rand(1)+1);
    b(1,i)=h;b(2,i)=l;
end
a=zeros(n1,n2);
a(n1*(b(2,:)-1)+b(1,:))=1;