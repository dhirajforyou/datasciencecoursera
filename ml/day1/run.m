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
c=Cost(X,y,theta);
fprintf('Initial Cost %f \n',c);

theta= gradientDescent(X,y,theta,0.01,1500)

hold on;
plot(X(:,2), X*theta,'-')
legend('Training Data','Linear Regression')
hold off

predict1=[1,3.5] *theta;
fprintf('For population 3.5k, profit prediction %f \n',...
      predict1*10000);

pause;
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);
J_vals = zeros(length(theta0_vals), length(theta1_vals));

for i = 1:length(theta0_vals)
  for j = 1:length(theta1_vals)
    t = [theta0_vals(i); theta1_vals(j)];    
    J_vals(i,j) = Cost(X, y, t);
  end
end

J_vals = J_vals';
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

figure;
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
