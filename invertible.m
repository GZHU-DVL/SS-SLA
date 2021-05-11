% test S matrix must be invertible
clear all, 
close all, 
clc

N=1000;
for i=2:N
a=triu(ones(i),0)-eye(i);
b=det((-1).^a);
if b==0
    display('b is not an invertible matrix');
    return    
end
end
display('b is an invertible matrix');
