%constantes
x_0 = 0;
t_f=1;
m=0.5;
r=0.8;
n=6;
S=1.22;
c_d=0.8;
g=9.81;
h=3;

%parametros
A=(n/2)*r^2*sin((2*pi)/n);
C=(1/(2*m))*c_d*S*A;
v_f=sqrt((2*g*m)/(c_d*S*A));

%Resolucion EDO
function derx = priorden(t,x,g,C) 
derx = g-C*x^2;
endfunction

[t,x] = ode23('priorden',[0 t_f],x_0,g,C);

y=(1/C)*log(cosh(t*sqrt(C*g)))-h
v=tanh(t*sqrt(C*g))*sqrt(g/C);

%Graficas
hold
grid
ti=title('Solucion de la EDO del sistema paracaidas');
%ti=title('Velocidad y distancia recorrida');
xl=xlabel('Tiempo [s]');
yl=ylabel('Velocidad [m/s]');
%yl=ylabel('V [m/s] - Y [m]');

plot(t,v,'---');
%plot(t,y);

plot(t,x);
line([0 t_f], [4 4], "linestyle", "-", "color", "r")
line([0 t_f], [v_f v_f], "linestyle", "-", "color", "g")
line([0 t_f], [2 2], "linestyle", "-", "color", "r")
p=legend ({"Función numerica", "Función analitica","Restricciones", "Velocidad final"}, "location", "south");

%p=legend ({"Velocidad", "Distancia"}, "location", "east");

set (p, "fontsize", 20);
set (ti, "fontsize", 20);
set (xl, "fontsize", 20);
set (yl, "fontsize", 20);
