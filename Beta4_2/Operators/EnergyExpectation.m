%
% ENERGY EXPECTATION
%
% RETURNS scalar value for Energy
%
% <H> = integral(psi* H psi)
% where H = -hBar^2/(2m) del2 + V
function energy = EnergyExpectation()
    global psi kSquared hBar mass V;
    
    % Hamiltonian = Kinetic (K) + Potential (V)
    
    % K = -hBar^2/2m del2 - do in Fourier Space
    psiFT = fftn(psi);
    psiFT = -kSquared.*psiFT; % grad^2 in x-space = -k^2 in k-space
    HPsi = ifftn(psiFT); %KPsi here - potential (V) not applied yet
    HPsi = -hBar^2/(2*mass)*HPsi;
    
    HPsi = HPsi + V.*psi;
    
    energy = sum(sum(sum(conj(psi).*HPsi)));
end
