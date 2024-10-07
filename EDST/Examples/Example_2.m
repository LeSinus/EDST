%######################################################
% Example 2: execution time of PCR6 versions
% Case : Influence of the frame of discernment size
%######################################################
clc
mass_m1=[];
mass_m2=[];

PCR6_time = [];
PCR6_optimized_time = [];

mass_m1=[0   0.5   0      0];
mass_m2=[0   0     0.5    0];
 
Max_theta = 7;
for i=2:1:Max_theta-1
    i
    zero_mass = repmat(0,1,2^i);
    mass_m1=[mass_m1 zero_mass];
    mass_m1(2^(i+1)-1)=0.5;
  
    mass_m2=[mass_m2 zero_mass];
    mass_m2(6)=0.5;

    m1=mass_m1';
    m2=mass_m2';

    Theta = i+1;
         
      tic;
      M_PCR6 = DST([m1 m2  ],8)  ;
      Execution_time(1) = [toc];
      
       tic;
      M_PCR6_Optimized = PCR6_Optimized([m1 m2  ])  ;
      Execution_time(2) = [toc];
   
      PCR6_time=[ PCR6_time; Theta  Execution_time(1) ];
      PCR6_optimized_time=[ PCR6_optimized_time;Theta  Execution_time(2) ];
                
    mass_m1(2^(i+1)-1)=0;
end

figure;
x = PCR6_time(:,1);
PCR6_time_y = PCR6_time(:,2); 
PCR6_optimized_time_y = PCR6_optimized_time(:,2); 
  
  
plot(x,PCR6_time_y,'r-s', 'LineWidth',0.5,'MarkerSize',10); 
hold on;
plot(x,PCR6_optimized_time_y,'b-o', 'LineWidth',0.5,'MarkerSize',10); %h1
 
xlabel('size of the frame of discernment (|\Theta|')
ylabel('execution time')
legend({'Time (PCR6)','Time (PCR6 - Optimized)'}, 'Position',[0.3 0.65 0.2 0.1])
 ax = gca;
 ax.XGrid = 'off'; 
 ax.YGrid = 'on';
