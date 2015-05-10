clear all;
close all;
clc;

data = load("ex1data1.txt");
X=data(:,1);
y=data(:,2);
m=length(y);

figure;
plot(X,y,'rx','MarkerSize',10);
ylabel('Profit in $10,000s');
xlabel('Population in City in 10,000s');

X=[ones(m,1),data(:,1)];
theta=zeros(2,1);
Cost(X,y,theta)
