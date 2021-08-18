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
%_________________________________________________________________________%

clear all 
clc
tic 
summ=0;
avg=0;
 for i=1:30
SearchAgents_no=30; % Number of search agents


Function_name='cec05'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)

Max_iteration=500; % Maximum numbef of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);

[Best_score,Best_pos,GWO_cg_curve]=KMGWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

% PSO_cg_curve=PSO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj); % run PSO to compare to results
% 
% figure('Position',[500 500 660 290])
% %Draw search space
% subplot(1,2,1);
% func_plot(Function_name);
% title('Parameter space')
% xlabel('x_1');
% ylabel('x_2');
% zlabel([Function_name,'( x_1 , x_2 )'])
% 
% %Draw objective space
% subplot(1,2,2);
% semilogy(GWO_cg_curve,'Color','r')
% hold on
% semilogy(PSO_cg_curve,'Color','b')
% title('Objective space')
% xlabel('Iteration');
% ylabel('Best score obtained so far');
% 
% axis tight
% grid on
% box on
% legend('GWO','PSO')

% display(['The best solution obtained by GWO is : ', num2str(Best_pos)]);
% display(['The best optimal value of the objective funciton found by GWO is : ', num2str(Best_score)]);
% 
%         

display( num2str(Best_score));
       
% best_temp= inf;


 summ=summ+Best_score;
 end
 avg=summ/30;
 [avg]

toc