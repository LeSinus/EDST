%######################################################
% Example 3: execution time of PCR6 versions 
% Case : Influence of the number of sources
%######################################################
clc
PCR6_time = [];
PCR6_optimized_time = [];

Max_sources = 4; % max number of sources

% size of FoD 
FoD_size = 4;
% number of focal elements per BBA
 focal_element_number =4;
 
for i=2:1:Max_sources
    i
    MasseIn = Generate_Masses (i, 2^(FoD_size), focal_element_number );
             
    tic;
    M_PCR6_old = PCR6(MasseIn)  ;
    Execution_time(1) = [toc];
      
    tic;
    M_PCR6_new = PCR6_Optimized(MasseIn)  ;
    Execution_time(2) = [toc];
   
    PCR6_time=[ PCR6_time; i  Execution_time(1) ];
    PCR6_optimized_time=[ PCR6_optimized_time; i  Execution_time(2) ];

end

figure;
x = PCR6_time(:,1);

PCR6_time_y = PCR6_time(:,2); 
PCR6_optimized_time_y = PCR6_optimized_time(:,2); 
  
plot(x,PCR6_time_y,'r-s', 'LineWidth',0.5,'MarkerSize',10); 
hold on;
plot(x,PCR6_optimized_time_y,'b-o', 'LineWidth',0.5,'MarkerSize',10); %h1
 
xlabel('number of sources')
ylabel('execution time')
legend({'Time (PCR6)','Time (PCR6 - Optimized)'}, 'Position',[0.3 0.65 0.2 0.1])
 ax = gca;
 ax.XGrid = 'off'; 
 ax.YGrid = 'on';
 
 
 