%code taken from course documents
function [w, iterations, e]=DeltaRuleTraining(Data, Target, eta, epochs ,w,error)
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

iterations=0;
e=error;
while e >= error && iterations < epochs
   
 iterations=iterations+1;
 wrong=0;
 deltaw=zeros(1,3);
 for i=1:rd
     out(i) = sum(w .* Data(i,:));  % delta rule 
     
% % %      %%%%% Perceptron rule 
% % %      temp=sum(w .* [Data(i,:),1]);
% % %      if temp < 0
% % %          out(i) = -1;
% % %      else
% % %          out(i)=+1;
% % %      end %%%%%%%%%% perceptron rule

     deltaw=vertcat(deltaw,eta*(Target(i)-out(i))*Data(i,:));
     err(i)=(Target(i)- out(i))^2;
     if err(i)>0
         wrong=wrong+1;
     end
 end
 
 w=w+sum(deltaw);
 
% for i=1:rd
% total error for perceptron
% e=wrong/rd;

% error for delta rule
e=sum(err)/rd;
end
end