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

% This function initialize the first population of search agents
function Positions=initialization(SearchAgents_no,dim,ub,lb)

Boundary_no= size(ub,2); % numnber of boundaries

% If the boundaries of all variables are equal and user enter a signle
% number for both ub and lb
if Boundary_no==1
    Positions=rand(SearchAgents_no,dim).*(ub-lb)+lb;
end

% If each variable has a different lb and ub
if Boundary_no>1
    for i=1:dim
        ub_i=ub(i);
        lb_i=lb(i);
        Positions(:,i)=rand(SearchAgents_no,1).*(ub_i-lb_i)+lb_i;
    for i=1:dim
    SearchAgents_no(i+1)=cos(i*acos(SearchAgents_no(i)));
    G(i)=((x(i)+1)*Value)/2;
end
    end
end