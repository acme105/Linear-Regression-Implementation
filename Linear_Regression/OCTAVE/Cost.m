function [ret , Params] = Cost(Features,ReqValue,Params,lambda)
	m = size(ReqValue,1);
	n = size(Features,2);
	First_MAT = Features*Params - ReqValue;
	Par = Params;
	grad = zeros(n,1);
	for i = 1:n
		grad(i) = sum((Features*Params - ReqValue) .* (Features(:,i))) / m + (i>1) * (lambda * Params(i)) / m;
	end
	alpha = sum(First_MAT) / sum(Features*grad);
	Params = Params - alpha * grad;
	First_MAT = Features*Params - ReqValue;
	ret = (First_MAT' * First_MAT) / (2*m) + lambda / (2*m) * (Params(2:end)' * Params(2:end));
end