xk = [0 , 0.11111 , 0.22222 , 0.33333 , 0.44444 , 0.55556 , 0.66667 , 0.77778 , 0.88889,1]
yk = [2.623 , 4.2709 , 5.2103 , 6.0562 , 6.8943 , 7.7872 , 8.7983 , 9.9981 , 11.466,13.293]

x=0:0.01:1

  A11=0
  A12=0
  A13=0
  A14=0
  A22=0
  A23=0
  A24=0
  A33=0
  A34=0
  A44=0
  B1=0
  B2=0
  B3=0
  B4=0
  for i=1:1:10
    A11 = A11+sin(xk(i))*sin(xk(i))
    A12 = A12+sin(xk(i))*xk(i)^4
    A13 = A13+sin(xk(i))*xk(i)
    A14 = A14+sin(xk(i))
    A22 = A22+xk(i)^8
    A23 = A23+xk(i)^5
    A24 = A24+xk(i)^4
    A33 = A33+xk(i)^2
    A34 = A34+xk(i)
    A44 = 1
    B1 = B1+yk(i)*sin(xk(i))
    B2 = B2+yk(i)*xk(i)^4
    B3 = B3+yk(i)*xk(i)
    B4 = B4+yk(i)
  endfor
  A = [A11,A12,A13,A14;
       A12,A22,A23,A24;
       A13,A23,A33,A34;
       A14,A24,A34,A44]
  B = [B1;B2;B3;B4]
  X = A\B
  figure
  plot(xk,yk,"or",x,X(1)*sin(x)+X(2)*x.^4+X(3)*x+X(4),"b")