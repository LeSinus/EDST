function [class_fusion]=decisionDST(masse,critere,r)

% Fusion decisionnelle de plusieurs classifieurs
%
% [class_fusion]=decision(masse,nbclasses,critere);
%
% entr�es   masse = masse obtenue apr�s combinaison 
%                    de taille : 2^D lignes et nb imagettes colonnes
%           nbclasses = nombre de classes (information perdu dans masse)
%           critere = critere de d�cision
%                     critere=1 max de la plausibilit�
%                     critere=2 max de la croyance
%                     critere=3 max de la croyance avec rejet
%                     critere=4 max de la probabilit� pignistique
%                     critere=5 Appriou
%
%12/03 A. Martin cr�ation du programme
%10/05 A. Martin Modification du programme pour le format de masse
%09/07 A. Martin Ajout d�cision Appriou

[lm,nbvec_test]=size(masse);
nbclasses=round(log2(lm));

% massetmp=[];
% for k=1:nbvec_test
%     massetmp=[massetmp masse(:,k)'];
% end
% masse=massetmp;
%  

if nargin==2
    r=0.5;
end
    
    
class_fusion=[];
for k=1:nbvec_test
    massetmp=masse(:,k);
    
    switch critere
        case 1 
		plau=mtopl(massetmp');
            %On ne consid�re que les plausibilit�s des singletons et on prend le maximum
            for i=1:nbclasses
                plau_singl(i)=plau(1+2^(i-1));
            end
            [valeurmax,indice]=max(plau_singl);
            class_fusion=[class_fusion indice];
        case {2, 3}
		    croy=mtobel(massetmp');
            %On ne consid�re que les croyances des singletons et on prend le maximum
            for i=1:nbclasses
                croy_singl(i)=croy(1+2^(i-1));
            end
            [valeurmax,indice]=max(croy_singl);
            if critere==3
                indice_complementaire=0;
                for i=nbclasses:-1:indice
                    indice_complementaire=indice_complementaire+2^(nbclasses-(nbclasses-i+1));
                end
                if (valeurmax>=croy(indice_complementaire))
                    class_fusion=[class_fusion indice];
                else
                    %d�cision impossible on met 0
                   % 'ACCIDENT : dans d�cision : d�cision impossible pour le crit�re 3 pour le test'
                    class_fusion=[class_fusion 0];
                end
            end
            
        case 4
            %mtobetp retourne les probabilit�s pignistiques sur les
            %singletons
            pign(1:nbclasses)=mtobetp(massetmp');
            [valeurmax,indice]=max(pign);
            class_fusion=[class_fusion indice];
        case 5
            plau=mtopl(massetmp');
            lambda=1;
            %r=0.5;
            md=BayesianMass(lambda,r,nbclasses);
            [valeurmax,indice]=max(plau.*md);
            class_fusion=[class_fusion indice];
            
       otherwise 
                'ACCIDENT : dans d�cision : choix du critere incorrecte'
    end
end
  
