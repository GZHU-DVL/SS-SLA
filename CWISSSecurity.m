% testing security of CW-ISS under conditon that alpha^2=lamda*(2-lamda)*Dx^2
clear all;
close all;
clc

lamda=1.0; % general in (0, 1], best in [0.9, 1.0] for good robustness
Dx=1; % deviation of host X
%alpha=1.03; % in general, more than 0 is ok
alpha=Dx*sqrt(2*lamda-lamda^2); % under the above special condition
Nv=512; % length of host vector
Nc=2;  % length of hidden message
WCR=10*log10((Nc*alpha^2+lamda^2*Dx^2*Nc)/(Nv*Dx^2)); % for example -21dB
% generate carrier U
seed=20071011;
rand('state', seed);
B=randn(Nv,Nv);
Q=orth(B);
U=Q(:, 1:Nc);
% generate dither vector: g and d
No=1000;  % number of observations
g=randn(Nc,No);
d=g;
for i=1: No
d(:, i)=abs(g(:,i))/norm(g(:,i));
end
% generate host X and message M
M=(randn(Nc, No)>0.00);  % 0 and 1 message
tm=d.*((-1).^M);
X=randn(Nv, No);
% CW-ISS embedding
Y=(eye(Nv)-lamda*U*U')*X+alpha*sqrt(Nc)*U*tm;
% draw a picture for the watermarked correlation
Z=U'*Y;
plot(Z(1, :), Z(2, :),'.');
% plot 3-dimensional
plot3(ZX(1, :), ZX(2, :), ZX(3, :), 'b.'); hold on
plot3(ZS(1, :), ZS(2, :), ZS(3, :), 'r.');
% legend('Host correlations','Watermarked correlations', 'FontSize',18,'FontName','Times New Roman');
xlabel('u1','FontSize',18,'FontName','Times New Roman');
ylabel('u2','FontSize',18,'FontName','Times New Roman');
zlabel('u3','FontSize',18,'FontName','Times New Roman');
axis([-4, 4, -4, 4, -4, 4]);  
set(gca,'FontSize',18,'FontName','Times New Roman');
hold off
% end







