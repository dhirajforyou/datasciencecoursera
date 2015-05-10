function [theta,error_history] = gradientDescent(X,y,theta,alpha,N)

m=length(y);
error_history=zeros(N,1);

for iter=1:N
  htheta=X*theta;
  theta0=theta(1) - alpha/m*sum((htheta-y).*X(:,1));
  theta1=theta(2) - alpha/m*sum((htheta-y).*X(:,2));
  theta=[theta0;theta1];
  error_history(iter)=Cost(X,y,theta);
end


end
