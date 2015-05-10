function c = Cost(X,y,theta)

m=length(y);
c=0;
predictions=X*theta;
sqerr=(predictions-y).^2;
c=1/(2*m) * sum(sqerr);
end
