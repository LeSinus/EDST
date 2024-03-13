%######################################################
% Example 1: Zadeh Paradox 
%######################################################
FoD_size = 3;
m1='  a(0.9)    b(0.1)';
m2='                b(0.1)   c(0.9)';

m1= StringToMassVector(m1,FoD_size);
m2= StringToMassVector(m2,FoD_size);

MasseIn  = [m1 m2];

M_Smets     = DST(MasseIn, 1)
M_DS        = DST(MasseIn, 2)
M_PCR6_old  = PCR6(MasseIn)  % old implementation of PCR6
M_PCR6_new  = PCR6_Optimized(MasseIn) % new and optimized implementation of PCR6
