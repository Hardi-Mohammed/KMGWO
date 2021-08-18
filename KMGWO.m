%KMGWO source code demo 1.0
% Developed in MATLAB R2017a
% Author and Programmer Hardi M. Mohammed, Zrar kh. Abdul
%e-Mail: hardi.mohammed@charmouniversity.org
%       Homepage: https://sites.google.com/a/charmouniversity.org/hardi-mohammed/           
%                       http://www.nci-rc.com/about.php 
%   Main Paper: 
% A new K-means grey wolf algorithm for engineering problems
% Hardi M. Mohammed, Zrar Kh. Abdul, Tarik A. Rashid, Abeer Alsadoon and Nebojsa Bacanin
% https://www.emerald.com/insight/content/doi/10.1108/WJE-10-2020-0527/full/html 

%KMGWO  is an improvement in Grey Wolf Optimizer
%which includes K-means algorithm to divide the population of GWO into different clusters, 
%the results shows that KMGWO is better than GWO in several  benchmark functions.

%% % KMGWO modification source codes by % % Hardi M. Mohammed  % % % %
% % we improved the code of GWO which have been written by mirjalili % % then we hybridize GWO algorithm with K-means. % %%
% disclaimer CODE of  GWO are taken from mirjalili website project
% code which is: http://www.alimirjalili.com/Projects.html 

function [Alpha_score,Alpha_pos,Convergence_curve]=KMGWO(SearchAgents_no,Max_iter,lb,ub,dim,fobj)

% initialize alpha, beta, and delta_pos
Alpha_pos=zeros(1,dim);
Alpha_score=inf; %change this to -inf for maximization problems

Beta_pos=zeros(1,dim);
Beta_score=inf; %change this to -inf for maximization problems

Delta_pos=zeros(1,dim);
Delta_score=inf; %change this to -inf for maximization problems

%Initialize the positions of search agents
Positions=initialization(SearchAgents_no,dim,ub,lb);

Convergence_curve=zeros(1,Max_iter);
%%

data=kmeans(Positions,2);
%mo=mode(data);
Positionst=Positions;
    %p=kmeans(data,2);
    Positions1=Positions(data(:,1)==1,:);
    Positions2=Positions(data(:,1)==2,:);

   
l=0;% Loop counter




%%
 for i=1:size(Positions1,1)  
        
       % Return back the search agents that go beyond the boundaries of the search space
        Flag4ub=Positions1(i,:)>ub;
        Flag4lb=Positions1(i,:)<lb;
        Positions1(i,:)=(Positions1(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;               
        
        % Calculate objective function for each search agent
        fitnessc1=fobj(Positions1(i,:));
        
     
 end
   for i=1:size(Positions2,1)  
        
       % Return back the search agents that go beyond the boundaries of the search space
        Flag4ub=Positions2(i,:)>ub;
        Flag4lb=Positions2(i,:)<lb;
        Positions2(i,:)=(Positions2(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;               
        
        % Calculate objective function for each search agent
        fitnessc2=fobj(Positions2(i,:));
        
     
   end
  
   

   
   if rand >0.5 
            if fitnessc1<fitnessc2
             
            Positions=Positions1;
            else
                Positions=Positions2;
            end 
%    elseif rand >0.5 && fitnessc1>fitnessc2
%        Positions=Positions2;
   else
       Positions=Positionst;
   end 


%%
% Main loop
while l<Max_iter
    for i=1:size(Positions,1)  
        
       % Return back the search agents that go beyond the boundaries of the search space
        Flag4ub=Positions(i,:)>ub;
        Flag4lb=Positions(i,:)<lb;
        Positions(i,:)=(Positions(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;               
        
        % Calculate objective function for each search agent
        fitness=fobj(Positions(i,:));
        
        % Update Alpha, Beta, and Delta
        if fitness<Alpha_score 
            Alpha_score=fitness; % Update alpha
            Alpha_pos=Positions(i,:);
        end
        
        if fitness>Alpha_score && fitness<Beta_score 
            Beta_score=fitness; % Update beta
            Beta_pos=Positions(i,:);
        end
        
        if fitness>Alpha_score && fitness>Beta_score && fitness<Delta_score 
            Delta_score=fitness; % Update delta
            Delta_pos=Positions(i,:);
        end
    end
    
    
    a=2-l*((2)/Max_iter); % a decreases linearly fron 2 to 0
    
    % Update the Position of search agents including omegas
    for i=1:size(Positions,1)
        for j=1:size(Positions,2)     
                       
            r1=rand(); % r1 is a random number in [0,1]
            r2=rand(); % r2 is a random number in [0,1]
            
            A1=2*a*r1-a; % Equation (3.3)
            C1=2*r2; % Equation (3.4)
            
            D_alpha=abs(C1*Alpha_pos(j)-Positions(i,j)); % Equation (3.5)-part 1
            X1=Alpha_pos(j)-A1*D_alpha; % Equation (3.6)-part 1
                       
            r1=rand();
            r2=rand();
            
            A2=2*a*r1-a; % Equation (3.3)
            C2=2*r2; % Equation (3.4)
            
            D_beta=abs(C2*Beta_pos(j)-Positions(i,j)); % Equation (3.5)-part 2
            X2=Beta_pos(j)-A2*D_beta; % Equation (3.6)-part 2       
            
            r1=rand();
            r2=rand(); 
            
            A3=2*a*r1-a; % Equation (3.3)
            C3=2*r2; % Equation (3.4)
            
            D_delta=abs(C3*Delta_pos(j)-Positions(i,j)); % Equation (3.5)-part 3
            X3=Delta_pos(j)-A3*D_delta; % Equation (3.5)-part 3             
            
            Positions(i,j)=(X1+X2+X3)/3;% Equation (3.7)
            
        end
    end
    l=l+1;    
    Convergence_curve(l)=Alpha_score;
end



