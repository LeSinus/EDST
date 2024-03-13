%######################################################
% Example : Working Example 
%######################################################
FoD_size = 3; 

m1='a(0.5)     b(0.2)  abc(0.3) ';
m2=' a(0.5)    ab(0.1)     c(0.4)   ';
m1=StringToMassVector(m1, FoD_size);
m2=StringToMassVector(m2, FoD_size);

MasseIn  = [m1 m2]

% get Focal Matrix
Focal_Matrix = get_Focal_Matrix(MasseIn)
% get Conflict Matrix
conflict_Matrix = get_Conflict_Matrix(Focal_Matrix, []);
%Comine using the old implementation of PCR6
M_PCR6 = PCR6([m1 m2  ])  
%Comine using the new implementation of PCR6
M_PCR6_Optimized = PCR6_Optimized([m1 m2  ])  