%######################################################
% Example 4: PCR6 variantsn (JPCR6, ZPCR6, SJPCR6, SZPCR6)
%######################################################
FoD_size = 3; 

m1='a(0.5)     b(0.2)  abc(0.3) ';
m2=' a(0.5)    ab(0.1)     c(0.4)   ';
m1=StringToMassVector(m1, FoD_size);
m2=StringToMassVector(m2, FoD_size);

MasseIn  = [m1 m2]

M_JPCR6     = JPCR6(MasseIn)
M_ZPCR6     = ZPCR6(MasseIn)
M_SJPCR6     = SJPCR6(MasseIn)
M_SZPCR6     = SZPCR6(MasseIn)
M_CBF       = CBF(MasseIn)
