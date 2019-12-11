%code taken from course documents and changes accordingly
function [w, iterations, e]=DeltaRuleSeq(Data, Target, eta, error, epochs)

%% Invoke as: [w, iterations, e] = DeltaRuleTraining(Data, Target, eta, error, epochs)
%% implements the delta  rule;
%% Input:
%%  Data is a matrix N x P data points/vectors
%%  Target is vector N x 1 of target values (true output) corresponding to the data points
%%  eta: learning rate; 
%%  error : desired approximation error;
%%  epochs: threshold on the number of epochs (iterations through the whole
%% data set)
%% Output:
%%  w is a vector of dimension P+1 x 1, where w_i is the weight for dimension i of a data point,
%%     for i=1:P, extended with weight w0 for the bias (input = 1)
%%  iterations = MIN{is the number of iterations taken to reach error threshold e, epochs}
%%  e: error threshold

[rd, cd]=size(Data);
[rt, ct]=size(Target);
if rt ~= rt
    error('num data points not equal to num target');
else
 w=[0,0,0];
 iterations=0;
e=error;
iterations1=0;
while e >= error &&  iterations <= epochs
 iterations=iterations+1;
 wrong=0;
 for i=1:rd
     out(i) = sum(w .* Data(i,:));  % delta rule 
     iterations1=iterations1+1;     
     deltaw=eta*(Target(i)-out(i))*Data(i,:);
     w=w+deltaw;
     err(i)=(Target(i)- out(i))^2;
     if err(i)>0
         wrong=wrong+1;
     end
 end  % for i=1:rd 
% total error for perceptron
% e=wrong/rd;

% error for delta rule
e=sum(err)/rd;
end

fprintf("========For incremental update========\n--->weight updates total= "+iterations1);
end