# NeuralNetworks_Hayesrothdataset

Problem 1. Implement the delta training rule for a two-input linear unit.  Train it to fit the target concept
 x_1+2x_2-2>0.  You must generate your own examples as follows: generate random pairs〖(x〗_1,x_2)  and assign them to the positive class if x_1+2x_2-2>0; otherwise, if  x_1+2x_2-2<0 assign them to the negative class.
a)	Plot the error E as a function of the number of training iterations/epochs.  
b)	Plot the decision surface after 5, 10, 50, 100 iterations. 
c)	Use different learning rates, analyze which works better and explain why.
d)	Now implement delta rule in an incremental fashion (as opposed to batch fashion when all the data are presented for training, the incremental approach updates the network after each example).  For the same choice of other parameters (learning rate, etc.), compare the two approaches in terms of total execution time and number of weight updates (use MATLAB tic-toc combination).
