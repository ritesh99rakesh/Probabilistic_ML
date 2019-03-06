function [mu,pk,z,si2] = gmm(X,K)
% input X is N*D data, K is number of clusters desired; numIter is the
% maximum number of EM iterations to run.  the output is: mu, which is K*D, the
% coordinates of the means; pk, which is K*1 and represents the cluster
% proportions; z, which is N*K, stores in positions z(n,k) the probability
% that the nth data point belongs to cluster k, specifying the cluster
% associated with each data point; si2 is the estimated (shared) variance of
% the data
  
[N D] = size(X);

if K >= N,
  error('you are trying to make too many clusters!');
end;

numIter = 200;  % maximum number of iterations to run


% initialize si2 dumbly
si2 = 1;

% initialize pk uniformly
pk = ones(K,1) / K;

% we initialize the means totally randomly
mu = randn(K,D);
z = zeros(N,K);
for iter=1:numIter,
  % in the first step, we do assignments: each point is probabilistically
  % assigned to each center
  
  for n=1:N,
    for k=1:K,
      % TBD: compute z(n,k) = log probability that the nth data point belongs
      % to cluster k
      z(n,k) = ???
    end;
    
    % turn log probabilities into actual probabilities (we are working with logs for numeric stability)
    maxZ   = max(z(n,:));
    z(n,:) = exp(z(n,:) - maxZ - log(sum(exp(z(n,:) - maxZ))));
  end;
  
  % TBD: re-estimate pk
  pk = ???
  
  % TBD: re-estimate the means
  mu = ???
  
  % TBD: re-estimate the variance
  si2 = ???
  
  % If you want to diagnose if EM is working properly, you can monitor the
  % incomplete data log-likelihood (it should be monotonically increasing)
end;
