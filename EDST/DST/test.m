m1=[0 0.4 0.1 0.2 0.2 0 0 0.1]';
m2=[0 0.2 0.3 0.1 0.1 0 0.2 0.1]';
m3=[0.1 0.2 0 0.4 0.1 0.1 0 0.1]';

m3d=discounting(m3,0.95);

M_comb_Smets=DST([m1 m2 m3d],1);
M_comb_PCR6=DST([m1 m2],8);

class_fusion=decisionDST(M_comb_Smets',1)
class_fusion=decisionDST(M_comb_PCR6',1)
class_fusion=decisionDST(M_comb_Smets',5,0.5)

