function f = A(x , l , rp)

lambda = zeros(15,1);
for j = 1:15
    lambda(j) = l(j);
end

psi(1) = max(g1(x) , -lambda(1)/(2*rp));
psi(2) = max(g2(x) , -lambda(2)/(2*rp));
psi(3) = max(g3(x) , -lambda(3)/(2*rp));
psi(4) = max(g4(x) , -lambda(4)/(2*rp));
psi(5) = max(g5(x) , -lambda(5)/(2*rp));
psi(6) = max(g6(x) , -lambda(6)/(2*rp));
psi(7) = max(g7(x) , -lambda(7)/(2*rp));
psi(8) = max(g8(x) , -lambda(8)/(2*rp));
psi(9) = max(g9(x) , -lambda(9)/(2*rp));
psi(10) = max(g10(x) , -lambda(10)/(2*rp));
psi(11) = max(g11(x) , -lambda(11)/(2*rp));
psi(12) = max(g12(x) , -lambda(12)/(2*rp));
psi(13) = max(g13(x) , -lambda(13)/(2*rp));
psi(14) = max(g14(x) , -lambda(14)/(2*rp));
psi(15) = max(g15(x) , -lambda(15)/(2*rp));

sum = 0;

for i=1:15
    
    sum = sum + lambda(i)*psi(i) + rp*psi(i)^2;
    
end
    
f = objF(x) + sum;

end