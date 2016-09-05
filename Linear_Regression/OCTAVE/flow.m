address = 'trainingdata.txt';
address2 = '';
lambda = 0;
numIter = 1500;
traindata=readFiles(address);

ansdata=readFiles(address2);

% traindata pre-processing
% m - number of Features && n - number of observations
m=size(traindata,2);
n=size(traindata,1);
Features = [ones(n,1) traindata(:,1:m-1)];
ReqValue = traindata(:,m);

% initial parameter guess
Params = zeros(m,1);
cost = [];
for iter = 1:numIter
	[cost(iter) , Params] = Cost(Features,ReqValue,Params,lambda);
	if iter >= 50
		if cost(iter) >= 0.9999999999 * cost(iter-1)
			break;
		end
	end
end

% give answer
ansdata = [ones(size(ansdata,1),1) ansdata];
Result = ansdata*Params;