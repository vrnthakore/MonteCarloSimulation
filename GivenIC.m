clc;
clear;

% Call rk4 function for initial condition x(0)=y(0)=z(0)=1
[x,y,z,t] = rk4([1 1 1]);

% Plot x(t), y(t) and z(t)
figure;
plot(t,x,'r',t,y,'b',t,z,'g');
grid on;
xlabel('t');
legend('x(t)','y(t)','z(t)');
title('Plot of x(t), y(t) and z(t)')

% Plot solutions of differential equations in 3D space
figure;
plot3(x,y,z); 
grid on;
xlabel('x');
ylabel('y');
zlabel('z');
title('Solutions of Differential Equations with initial conditions x(0)=y(0)=z(0)=1');