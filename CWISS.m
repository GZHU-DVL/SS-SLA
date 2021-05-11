% test the pdf of SS embedding schemes.
clear all; close all; clc
format long;
Nv=3; Nc=2; No=10000; alpha=6; lamda=0.90; Dx=1;
%generate orthogonal basis U with size Nv*Nv
% seed=19761222; rand('state', seed); 
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

YCWISS1=X;YCWISS2=X; YCWISS3=X;

for i=1:No
    
    YCWISS1(:,i)=CWISSembed(alpha, lamda, X(:,i), U1, M(:,i));
    YCWISS2(:,i)=CWISSembed(alpha, lamda, X(:,i), U2, M(:,i));
%     YCWISS3(:,i)=CWISSembed(alpha, lamda, X(:,i), U3, M(:,i));
end
% draw a picture to show the pdf of the watermarked signal
U1=2*U1*alpha; % only for drawing
U2=2*U2*alpha; % only for drawing
figure(1)
plot3(YCWISS1(1, :), YCWISS1(2, :),YCWISS1(3, :), 'b.'); hold on;
h=legend('$$\textbf{y}|\textbf{U}_{1}$$', 'FontSize',12);
set(h, 'Interpreter','latex');
% plot(YSS1(1, :), YSS1(2, :),'r.', YSS2(1, :), YSS2(2, :),'b.');
plot3([-U1(1, 1),U1(1, 1)], [-U1(2, 1),U1(2, 1)], [-U1(3, 1),U1(3, 1)],  'k', 'LineWidth',1);
plot3([-U1(1, 2),U1(1, 2)], [-U1(2, 2),U1(2, 2)], [-U1(3, 2),U1(3, 2)],  'k', 'LineWidth',1); 
% quiver3(-U1(1, 1),-U1(2, 1),-U1(3, 1),U1(1, 1),U1(2, 1),U1(3, 1), 2, 'k', 'filled', 'LineWidth',2);
% quiver3(-U1(1, 2),-U1(2, 2),-U1(3, 2),U1(1, 2),U1(2, 2),U1(3, 2), 2, 'k', 'filled', 'LineWidth',2); 
% quiver3(0,0,0,U1(1, 1),U1(2, 1),U1(3, 1), 2, 'k', 'filled', 'LineWidth',2);
% quiver3(0,0,0,U1(1, 2),U1(2, 2),U1(3, 2), 2, 'k', 'filled', 'LineWidth',2); 
% plot3([0, A(1, 3)],[0, A(2, 3)],[0, A(3, 3)], 'r', 'LineWidth',2);
text('Interpreter','latex','String', '$$\textbf{u}^{1}_1$$', 'FontSize',18);
text('Interpreter','latex','String', '$$\textbf{u}^{1}_2$$', 'FontSize',18);
text('Interpreter','latex','String', '$$O$$', 'FontSize',18);
grid on
set(gca,'FontSize',18,'FontName','Times New Roman');
axis([-10, 10, -10, 10, -10, 10]);  
hold off;

figure(2)
plot3(YCWISS2(1, :), YCWISS2(2, :),YCWISS2(3, :), 'r+'); hold on;
h=legend('$$\textbf{y}|\textbf{U}_{2}$$', 'FontSize',12);
set(h, 'Interpreter','latex');
plot3([-U2(1, 1),U2(1, 1)], [-U2(2, 1),U2(2, 1)], [-U2(3, 1),U2(3, 1)],  'k', 'LineWidth',1);
plot3([-U2(1, 2),U2(1, 2)], [-U2(2, 2),U2(2, 2)], [-U2(3, 2),U2(3, 2)],  'k', 'LineWidth',1); 
% quiver3(-U1(1, 1),-U1(2, 1),-U1(3, 1),U1(1, 1),U1(2, 1),U1(3, 1), 2, 'k', 'filled', 'LineWidth',2);
% quiver3(-U1(1, 2),-U1(2, 2),-U1(3, 2),U1(1, 2),U1(2, 2),U1(3, 2), 2, 'k', 'filled', 'LineWidth',2); 
text('Interpreter','latex','String', '$$\textbf{u}^{2}_1$$', 'FontSize',18);
text('Interpreter','latex','String', '$$\textbf{u}^{2}_2$$', 'FontSize',18);
text('Interpreter','latex','String', '$$O$$', 'FontSize',18);
grid on
set(gca,'FontSize',18,'FontName','Times New Roman');
axis([-10, 10, -10, 10, -10, 10]);
hold off;

figure(3)
plot3(YCWISS1(1, :), YCWISS1(2, :),YCWISS1(3, :), 'b.'); hold on;
plot3(YCWISS2(1, :), YCWISS2(2, :),YCWISS2(3, :), 'r+'); 
h=legend('$$\textbf{y}|\textbf{U}_{1}$$','$$\textbf{y}|\textbf{U}_{2}$$', 'FontSize',18);
set(h, 'Interpreter','latex');
grid on
set(gca,'FontSize',18,'FontName','Times New Roman');
axis([-10, 10, -10, 10, -10,10]);
hold off;

