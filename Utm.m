% test the distribution of Utm, a circle projects a plane spanned by U1
clear all; close all; clc
format long;
Nv=3; Nc=2; No=10000; alpha=5; lamda=0.75; Dx=1;
%generate orthogonal basis U with size Nv*Nv
% seed=19761222; rand('state', seed); 
X=Dx*randn(Nv, No);
m=(randn(Nc, No)>0.00);  % message 0 and 1
A=orth(rand(Nv,Nv));
% A=rand(Nv,Nv);
% A=eye(3); % test Utm in the standard orthogonal basis
tm=zeros(Nc, No);
% test Nv=2
% U1=A(:, 1);
% U2=A(:, 2);
% test Nv=3
U1=A(:, [2 3]);
% U2=A(:, [2 3]);
% U3=A(:, [1 3]);
% theta=2*pi*rand(1);
% Q=[cos(theta) -sin(theta); sin(theta) cos(theta)];
% U2=U2*Q;
YISS1=X; 
% YISS2=X; 
for j=1: No
g=randn(Nc,1);
d=g;
for i=1: Nc
d(i)=abs(g(i))/norm(g);
end
tm(:,j)=d.*((-1).^m(:,j));
YISS1(:,j)=(eye(Nv)-lamda*U1*U1')*X(:,j);
end
tm=alpha*sqrt(Nc)*tm;

% plot 3-dimensional
U1=2*U1;
figure(1)
plot3(YISS1(1, :), YISS1(2, :),YISS1(3, :), 'b.'); hold on;
plot3([-U1(1, 1),U1(1, 1)], [-U1(2, 1),U1(2, 1)], [-U1(3, 1),U1(3, 1)],  'k', 'LineWidth',1);
plot3([-U1(1, 2),U1(1, 2)], [-U1(2, 2),U1(2, 2)], [-U1(3, 2),U1(3, 2)],  'k', 'LineWidth',1); 
grid on
axis([-2, 2, -2, 2, -2, 2]);  
title('Distribution of first term of CWISS');
hold off;

figure(2);
plot3(tm(1, :), tm(2, :), zeros(1, No), 'r+'); hold on;
% Y1=U1*tm;
% Y2=U2*tm;
Y1=(1/2)*U1*tm;
U1=U1*alpha; % only for drawing
% U2=2*U2*alpha; % only for drawing
% Y2=alpha*sqrt(Nc)*U2*tm;
plot3(Y1(1, :), Y1(2, :),Y1(3, :),'b.');
% plot3(Y2(1, :), Y2(2, :),Y1(3, :),'b.'); 
% quiver(U1(:, 1), U1(:, 2));
plot3([-U1(1, 1),U1(1, 1)], [-U1(2, 1),U1(2, 1)], [-U1(3, 1),U1(3, 1)],  'k', 'LineWidth',1);
plot3([-U1(1, 2),U1(1, 2)], [-U1(2, 2),U1(2, 2)], [-U1(3, 2),U1(3, 2)],  'k', 'LineWidth',1); 
% quiver3(0,0,0,U1(1, 1),U1(2, 1),U1(3, 1), 2, 'r', 'filled', 'LineWidth',2);
% quiver3(0,0,0,U1(1, 2),U1(2, 2),U1(3, 2), 2, 'r', 'filled', 'LineWidth',2); 
% plot3([0, A(1, 3)],[0, A(2, 3)],[0, A(3, 3)], 'r', 'LineWidth',2);
% plot3([-A(1, 3), A(1, 3)],[-A(2, 3), A(2, 3)],[-A(3, 3), A(3, 3)], 'r', 'LineWidth',2);
% plot3(U1(1, 3),U1(2, 3),U1(3, 3), 'r', 'LineWidth',2); hold on
% quiver3(0,0,0,U2(1, 1),U2(2, 1),U2(3, 1), 2, 'b', 'filled', 'LineWidth',2); 
% quiver3(0,0,0,U2(1, 2),U2(2, 2),U2(3, 2), 2, 'b', 'filled', 'LineWidth',2); 
% text('Interpreter','latex','String', '$$\textbf{u}_1$$', 'FontSize',18);
% text('Interpreter','latex','String', '$$\textbf{u}_2$$', 'FontSize',18);
% text('Interpreter','latex','String', '$$O$$', 'FontSize',18);
grid on
axis([-10, 10, -10, 10, -10, 10]);  
title('Distribution of second term of CWISS');
hold off;








