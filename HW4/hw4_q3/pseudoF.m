function f = pseudoF(x , rp)

x1 = x(1);
x2 = x(2);

P = (max(0 , g1(x)))^2 + (max(0 , g2(x)))^2 + (max(0 , g3(x)))^2 + (max(0 , g4(x)))^2 ;

f = objF(x) + rp*P;

end