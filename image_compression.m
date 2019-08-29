close all

clc

clear all

 

A = imread('/Users/Mauli/Desktop/4.png');

A=rgb2gray(A);

C=[1:250;];

% Finding Equations of Each row (converting 250 values into 24 values)

B=A(1,:);

f=fit(C.',B.','sin8');

seq=[];

coef1=coeffvalues(f);

coef=[coef1];

 

for i=2:250

    B=A(i,:);

    f=fit(C.',B.','sin8');

    coef1=coeffvalues(f);

    coef=[coef;coef1];

    plot(f);

    hold on

    plot(B);

end

 

 

 

 

RLA=coef;

 reconstruct=[];

 for j=1:250

     temp=[];

     for x=1:250

            %matrix_reshape;

            sumofsine = uint8(RLA(j,1)*sin(RLA(j,2)*x+RLA(j,3))+RLA(j,4)*sin(RLA(j,5)*x+RLA(j,6))+RLA(j,7)*sin(RLA(j,8)*x+RLA(j,9))+RLA(j,10)*sin(RLA(j,11)*x+RLA(j,12))+RLA(j,13)*sin(RLA(j,14)*x+RLA(j,15))+RLA(j,16)*sin(RLA(j,17)*x+RLA(j,18))+RLA(j,19)*sin(RLA(j,20)*x+RLA(j,21))+RLA(j,22)*sin(RLA(j,23)*x+RLA(j,24)));%matrix_reshape =(A+(rand()*250));

            temp=[temp sumofsine];

            

     end

     reconstruct(j,:)=temp;

     

     %temp=temp';

     %reconstruct=[reconstruct temp];

 end

 %reconstruct=matrix_reshape;

 reconstruct=mat2gray(reconstruct)

 imshow(reconstruct)
