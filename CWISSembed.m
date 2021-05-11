function s=CWISSembed(alpha, lamda, x, U, m)
[Nv, Nc]=size(U);
g=randn(Nc,1);
d=g;
for i=1: Nc
d(i)=abs(g(i))/norm(g);
end
tm=d.*((-1).^m);
% WCR=10*log10((Nc*alpha^2+lamda^2*Dx^2*Nc)/(Nv*Dx^2)); % for example -21dB
% CW-ISS embedding
s=(eye(Nv)-lamda*U*U')*x+alpha*sqrt(Nc)*U*tm;










