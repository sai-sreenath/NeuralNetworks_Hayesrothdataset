function [dataMatrix] =  Question_1_2(learningRate)
    target= [-2 1 2];
    size =10;
    slope=-0.5;
    intercept=1;
    x=10*(rand(1,100)-0.5);
    y=slope*x+intercept;
    xt=10*(rand(1,size)-0.5);
    yt=10*(rand(1,size)-0.5);
    class=zeros(size,1);
    dataMatrix=[ones(size,1),transpose(xt),transpose(yt)];
    for i=1:size
        class(i)= dot(target(1,:), dataMatrix(i,:));
    end
    
    dataMatrix=[dataMatrix, class];
    w=(rand(1,3)*10)+1;
    % Question 1(a)
    iterations_number=0;
    weightVector=w;
    e=10;
    
    for i=1:100        
        iterations_number=iterations_number+1;
        [w, iterations, e]=DeltaRuleTraining(dataMatrix(:,1:3), dataMatrix(:,4), learningRate, 1 ,w,1);
        err_matrix(i)= e;
        iteration_i(i)=iterations_number;
        weightVector=vertcat(weightVector,w);
    end
    error_Matrix=[ transpose(iteration_i), transpose(err_matrix) ];
    figure(1)
    plot(error_Matrix(:,2))
    % Question 1(b)
    init=weightVector(1,:);
    itr_5=weightVector(5,:);
    itr_10=weightVector(10,:);
    itr_50=weightVector(50,:);
    itr_100=weightVector(100,:);
    
    figure(2)   
    plotgraph(init,'Initial Assumption');
    plotgraph(itr_5,' 5 iterations');
    plotgraph(itr_10,' 10 iterations');
    plotgraph(itr_50,' 50 iterations');
    plotgraph(itr_100,' 100 iterations');
     plotgraph(target,'Target hyperplane');
    hold off
    legend
    w=[0,0,0];
    % Question 1(d)
    tic
    [w, iterations, e]=DeltaRuleTraining(dataMatrix(:,1:3), dataMatrix(:,4), learningRate, 100 ,w,0.01);
    fprintf("==========For Batch update==========\n");
    fprintf("-->weight updates = "+iterations);fprintf(" | error "+e);fprintf("\n");
    w
    toc 
    tic
    [w, iterations, e]=DeltaRuleSeq(dataMatrix(:,1:3), dataMatrix(:,4), learningRate ,0.01,100);
    fprintf(" | error="+e+"\n");
    w
    toc  
    iterations_number=0;
    tic
    prior_Error=0;
    w=[0,0,0];
    % Question 2
    fprintf("\n\n==========For adaptive rates==========\n");
    for i=1:100        
        iterations_number=iterations_number+1;
        wr=w;        
        [w, iterations, e]=DeltaRuleTraining(dataMatrix(:,1:3), dataMatrix(:,4), learningRate, 1 ,w,0.01);
        err_matrix(i)=e;
        iteration_i(i)=iterations_number;
        error=e-prior_Error;
        prior_Error=e;
        if(error<0)
            learningRate=learningRate*0.9;
            w=wr;
        else
            learningRate=learningRate*1.2;     
        end
        if(e<0.1)
            break
        end
    end  
    adaptErrorMat=[iteration_i',err_matrix'];
    figure(3)
    plot(adaptErrorMat(:,2))
    fprintf("-->weight updates="+iterations_number);
    w
    fprintf("\n");
    toc
    fprintf("\n\n==========For Decaying Rates==========\n");
    w=[0,0,0];
    iterations_number=0;
    for i=1:100        
        iterations_number=iterations_number+1;        
        [w, iterations, e]=DeltaRuleTraining(dataMatrix(:,1:3), dataMatrix(:,4), learningRate, 1 ,w,0.01);
        error_matrix1(i)=e;
        itr(i)=iterations_number;
        learningRate=learningRate*0.9;
        if(e<0.01)
            break
        end
    end
    decayErrorMat=[itr',error_matrix1'];
    figure(4)
    plot(decayErrorMat(:,2))
    w
    fprintf("--> weight updates="+iterations_number+"\n");
    
end