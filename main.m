% test the pdf of SS embedding schemes.
clear all; close all; clc
format long;
Nv=3; Nc=2; No=10000; alpha=5; lamda=0.99; Dx=1; eta=9.0;
%generate orthogonal basis U with size Nv*Nv
seed=19761222; rand('state', seed); 
A=orth(rand(Nv,Nv));

% test Nv=2
% U1=A(:, 1);
% U2=A(:, 2);
% test Nv=3
U1=A(:, [1 2]);
U2=A(:, [2 3]);
% U3=A(:, [1 3]);

% generate Ur by rotating U
% theta=2*pi*rand(1);
% Q=[cos(theta) -sin(theta); sin(theta) cos(theta)];
% U2=U1*Q;

M=(randn(Nc, No)>0.00);  % message 0 and 1 
X=Dx*randn(Nv, No);

YSS1=X; YISS1=X; YCWISS1=X; YNW1=X; YRNW1=X;
YSS2=X; YISS2=X; YCWISS2=X; YNW2=X; YRNW2=X;
YSS3=X; YISS3=X; YCWISS3=X; YNW3=X; YRNW3=X;

for i=1:No
    Sm=(-1).^M(:,i);
    
%     YSS1(:,i)=X(:,i)+alpha*U1*Sm;
%     YSS2(:,i)=X(:,i)+alpha*U2*Sm;
%     YSS3(:,i)=X(:,i)+alpha*U3*Sm;
    
%     YISS1(:,i)=(eye(Nv)-lamda*U1*U1')*X(:,i)+alpha*U1*Sm;
%     YISS2(:,i)=(eye(Nv)-lamda*U2*U2')*X(:,i)+alpha*U2*Sm;
%     YISS3(:,i)=(eye(Nv)-lamda*U3*U3')*X(:,i)+alpha*U3*Sm;

%     YCWISS1(:,i)=CWISSembed(alpha, lamda, X(:,i), U1, M(:,i));
%     YCWISS2(:,i)=CWISSembed(alpha, lamda, X(:,i), U2, M(:,i));
%     YCWISS3(:,i)=CWISSembed(alpha, lamda, X(:,i), U3, M(:,i));

%     YNW1(:,i)=NWembed(U1, M(:,i), X(:,i), 1);
%     YNW2(:,i)=NWembed(U2, M(:,i), X(:,i), 1);
%     YNW3(:,i)=NWembed(U3, M(:,i), X(:,i), 1);
    
    YRNW1(:,i)=NWembed(U1, M(:,i), X(:,i), eta);
    YRNW2(:,i)=NWembed(U2, M(:,i), X(:,i), eta);
%     YRNW3(:,i)=NWembed(U3, M(:,i), X(:,i), eta);
end
% draw a picture to show the pdf of the watermarked signal
% plot(YSS1(1, :), YSS1(2, :),'r.', YSS2(1, :), YSS2(2, :),'b.');
% plot(YISS1(1, :), YISS1(2, :),'r.', YISS2(1, :), YISS2(2, :),'b.');
% plot(YNW1(1, :), YNW1(2, :),'r.', YNW2(1, :), YNW2(2, :),'b.');
% plot(YRNW1(1, :), YRNW1(2, :),'r.', YRNW2(1, :), YRNW2(2, :),'b.');

% plot 3-dimensional
% plot3(YSS1(1, :), YSS1(2, :),YSS1(3, :),'r.'); hold on
% plot3(YSS2(1, :), YSS2(2, :),YSS2(3, :),'b+');
% plot3(YSS3(1, :), YSS3(2, :),YSS3(3, :),'g.');

% plot3(YISS1(1, :), YISS1(2, :),YISS1(3, :),'r.'); hold on
% plot3(YISS2(1, :), YISS2(2, :),YISS2(3, :),'b+');
% plot3(YISS3(1, :), YISS3(2, :),YISS3(3, :),'g.');

% figure(1);
% plot3(YCWISS1(1, :), YCWISS1(2, :),YCWISS1(3, :),'r.'); 
% h=legend('$$\textbf{y}|\textbf{U}_{1}^{\ast}$$', 'FontSize',18);
% set(h, 'Interpreter','latex');
% grid on
% set(gca,'FontSize',18,'FontName','Times New Roman');
% hold off
% 
% figure(2);
% plot3(YCWISS2(1, :), YCWISS2(2, :),YCWISS2(3, :),'b+');
% h=legend('$$\textbf{y}|\textbf{U}_{2}^{\ast}$$', 'FontSize',18);
% set(h, 'Interpreter','latex');
% grid on
% set(gca,'FontSize',18,'FontName','Times New Roman');
% hold off
% 
% figure(3);
% plot3(YCWISS1(1, :), YCWISS1(2, :),YCWISS1(3, :),'r.'); hold on
% plot3(YCWISS2(1, :), YCWISS2(2, :),YCWISS2(3, :),'b+');
% h=legend('$$\textbf{y}|\textbf{U}_{1}^{\ast}$$','$$\textbf{y}|\textbf{U}_{2}^{\ast}$$', 'FontSize',18);
% set(h, 'Interpreter','latex');
% grid on
% set(gca,'FontSize',18,'FontName','Times New Roman');
% hold off

% plot3(YCWISS1(1, :), YCWISS1(2, :),YCWISS1(3, :),'r.'); hold on
% plot3(YCWISS2(1, :), YCWISS2(2, :),YCWISS2(3, :),'b+');

% figure(1)
% plot3(YNW1(1, :), YNW1(2, :),YNW1(3, :),'r.'); 
% h=legend('$$\textbf{y}|\textbf{U}_{1}^{\ast}$$', 'FontSize',18);
% set(h, 'Interpreter','latex');
% grid on
% set(gca,'FontSize',18,'FontName','Times New Roman');
% hold off
% 
% figure(2)
% plot3(YNW2(1, :), YNW2(2, :),YNW2(3, :),'g+');
% h=legend('$$\textbf{y}|\textbf{U}_{1}^{\ast}$$', 'FontSize',18);
% set(h, 'Interpreter','latex');
% grid on
% set(gca,'FontSize',18,'FontName','Times New Roman');
% hold off

% figure(1);
% plot3(YRNW1(1, :), YRNW1(2, :),YRNW1(3, :),'r.'); 
% h=legend('$$\textbf{y}|\textbf{U}_{1}^{\ast}$$', 'FontSize',18);
% set(h, 'Interpreter','latex');
% grid on
% set(gca,'FontSize',18,'FontName','Times New Roman');
% hold off
% 
% figure(2);
% plot3(YRNW2(1, :), YRNW2(2, :),YRNW2(3, :),'b+');
% h=legend('$$\textbf{y}|\textbf{U}_{2}^{\ast}$$', 'FontSize',18);
% set(h, 'Interpreter','latex');
% grid on
% set(gca,'FontSize',18,'FontName','Times New Roman');
% hold off
% 
% figure(3);
% plot3(YRNW1(1, :), YRNW1(2, :),YRNW1(3, :),'r.'); hold on
% plot3(YRNW2(1, :), YRNW2(2, :),YRNW2(3, :),'b+');
% h=legend('$$\textbf{y}|\textbf{U}_{1}^{\ast}$$','$$\textbf{y}|\textbf{U}_{2}^{\ast}$$', 'FontSize',18);
% set(h, 'Interpreter','latex');
% grid on
% set(gca,'FontSize',18,'FontName','Times New Roman');
% hold off

plot3(YRNW1(1, :), YRNW1(2, :),YRNW1(3, :),'r.'); hold on
plot3(YRNW2(1, :), YRNW2(2, :),YRNW2(3, :),'b+');
% plot3(YRNW3(1, :), YRNW3(2, :),YRNW3(3, :),'g.');
% subplot(1,2,1), plot3(YRNW1(1, :), YRNW1(2, :),YRNW1(3, :),'r.'); 
% grid on
% subplot(1,2,2), plot3(YRNW2(1, :), YRNW2(2, :),YRNW2(3, :),'b.');
% grid on
% subplot(1,3,3), plot3(YRNW3(1, :), YRNW3(2, :),YRNW3(3, :),'g.');

h=legend('$$\textbf{y}|\textbf{U}_{1}^{\ast}$$','$$\textbf{y}|\textbf{U}_{2}^{\ast}$$', 'FontSize',18);
set(h, 'Interpreter','latex');
% xlabel('u1','FontSize',18,'FontName','Times New Roman');
% ylabel('u2','FontSize',18,'FontName','Times New Roman');
% zlabel('u3','FontSize',18,'FontName','Times New Roman');
% axis([-4, 4, -4, 4, -4, 4]);  
grid on
set(gca,'FontSize',18,'FontName','Times New Roman');
hold off
% end

