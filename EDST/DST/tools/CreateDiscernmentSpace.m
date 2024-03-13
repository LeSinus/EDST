function [ind]=CreateDiscernmentSpace(natoms)


ind(1)={[1]};
ind(2)={[2]};
step =3;
while step<2^natoms
    ind(step)={[step]};
    step=step+1;
    indatom=step;
    for step2=2:indatom-2
        ind(step)={union(ind{indatom-1},ind{step2})};
        step=step+1;
    end
end
