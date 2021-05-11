% test the pdf of host.
clear all; close all; clc
format long;
Nv=3; No=10000; Dx=1; 
X=Dx*randn(Nv, No);
% plot 3-dimensional
plot3(X(1, :), X(2, :),X(3, :),'b.'); 
hold on;
% plot3(YSS1(1, :), YSS1(2, :),YSS1(3, :), 'b.'); 
A=eye(3); % test Utm in the standard orthogonal basis
% test Nv=2
% U1=A(:, 1);
% U2=A(:, 2);
% test Nv=3
U1=2*A(:, [1 2]);
% U2=A(:, [2 3]);

% plot(YSS1(1, :), YSS1(2, :),'r.', YSS2(1, :), YSS2(2, :),'b.');
grid on
% plot(YISS1(1, :), YISS1(2, :),'r.', YISS2(1, :), YISS2(2, :),'b.');
quiver3(-U1(1, 1),-U1(2, 1),-U1(3, 1),U1(1, 1),U1(2, 1),U1(3, 1), 2, 'k', 'filled', 'LineWidth',2);
quiver3(-U1(1, 2),-U1(2, 2),-U1(3, 2),U1(1, 2),U1(2, 2),U1(3, 2), 2, 'k', 'filled', 'LineWidth',2); 
% quiver3(0,0,0,U1(1, 1),U1(2, 1),U1(3, 1), 2, 'k', 'filled', 'LineWidth',2);
% quiver3(0,0,0,U1(1, 2),U1(2, 2),U1(3, 2), 2, 'k', 'filled', 'LineWidth',2); 
% plot3([0, A(1, 3)],[0, A(2, 3)],[0, A(3, 3)], 'r', 'LineWidth',2);
text('Interpreter','latex','String', '$$\textbf{u}_1$$', 'FontSize',18);
text('Interpreter','latex','String', '$$\textbf{u}_2$$', 'FontSize',18);
text('Interpreter','latex','String', '$$O$$', 'FontSize',18);
set(gca,'FontSize',18,'FontName','Times New Roman');
hold off
