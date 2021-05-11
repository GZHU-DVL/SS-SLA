% permutation matrix test for SPL work
Nc=5;
S=getMod(Nc);
% generate a 2^N*2^N random permutation matrix
I=eye(2^Nc); %obtain an identity matrix
% obtain a column permuation matrix by random exchange columns of I
H=I(:, randperm(2^Nc)); 
R=S*S'; % S*S' =(2^N)*I;
iR=inv(R); %  it is (1/2^N)*I;
Q=S*H*S'; % for viewing what Q is
% being shown to be not a column permutation matrix
P=S*H*S'*inv(S*S'); 
% Is there a special H such that P is a permutation matrix? try many
% times
L=det(P);









