function S=getMod(N)
a=[0: 2^N-1];
M=zeros(N, 2^N);
S=M;
for i=1: 2^N
b=dec2bin(a(i), N);
c=str2num(b');
M(:, i)=c;
end
S=(-1).^M;