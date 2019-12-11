function Question3( eta, error, epochs)
A = load("hayes-roth.data");
[r, c]=size(A);
A(:,1)=[];

D(1:r,1:1) = 0.61;
A=[D,A];
Data= A(:,1:5);
Target= A(:,6);

[rd, cd]=size(Data);
[rt, ct]=size(Target);


w=[1,1,1,1,1];
iterations=0;
correct=0;
e=error;
while e >= error &&  iterations <= epochs
 iterations=iterations+1;
 
 for i=1:rd     
     out(i) = rem(round(sum(w .* (Data(i,:)+Data(i,:).^2))),3)+1;
     deltaw=eta*(Target(i)-out(i))*(Data(i,:)+Data(i,:).^2);
     w=w+deltaw;
     err(i)=(Target(i)- out(i))^2;
 end  
e=sum(err)/rd;
end

Testdata = dlmread('hayes-roth.test');
[r1, c1]=size(Testdata);


D1(1:r1,1:1) = 0.61;
Testdata=[D1,Testdata];
Data1= Testdata(:,1:5);
Target= Testdata(:,6);


for i=1:r1  
    predicted(i)=rem(round(sum(w .* (Data1(i,:)+Data1(i,:).^2))),3)+1;
    
    if predicted(i)== Target(i)
        correct=correct+1;
    end
end

fprintf("Accuracy="+correct/(r1)+"\n");
 end
