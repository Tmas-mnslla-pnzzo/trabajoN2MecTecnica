x0 = 0;
t_f=1;
m=0.5;
r=0.8;
n=6;
S=1.22;
c_d=0.8;
g=9.81;
A=(n/2)*r^2*sin((2*pi)/n);
C=(1/(2*m))*c_d*S*A;
v_f=sqrt((2*g*m)/(c_d*S*A));

function derx = priorden(t,x,g,C) 
derx = g-C*x^2;
endfunction

[t,x] = ode23('priorden',[0 t_f],x0,g,C);
hold
grid
title('Solucion de la EDO del sistema paracaidas');
xlabel('t [s]');
ylabel('V [m/s]');
plot(t,x);
line([0 t_f], [4 4], "linestyle", "-", "color", "r")
line([0 t_f], [v_f v_f], "linestyle", "-", "color", "g")
line([0 t_f], [2 2], "linestyle", "-", "color", "r")

