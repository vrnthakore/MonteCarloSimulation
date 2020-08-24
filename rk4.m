% Runge Kutta 4th Order
function [x,y,z,t] = rk4(R) 
% rk4 function takes Initial Condition vector as input and outputs the
% values of x, y and z for time in the range as sepecified by t at
% different time steps as specified by h
    
h=0.01; % step size
t = 0:0.01:40; 

% Set Initial Conditions
x(1) = R(1);
y(1) = R(2);
z(1) = R(3);

% Define ODE function handles
f1=@(x,y) 10*(y-x);
f2=@(x,y,z) x*(28-z)-y;
f3=@(x,y,z) x*y-(8*z/3);

% Calculate values of x, y and z
for i=1:(length(t)-1)

    k1 = h*f1(x(i),y(i));
    l1 = h*f2(x(i),y(i),z(i));
    m1 = h*f3(x(i),y(i),z(i));
    
    k2 = h*f1(x(i)+0.5*k1,y(i)+0.5*l1);
    l2 = h*f2(x(i)+0.5*k1,y(i)+0.5*l1,z(i)+0.5*m1);
    m2 = h*f3(x(i)+0.5*k1,y(i)+0.5*l1,z(i)+0.5*m1);
    
    k3 = h*f1(x(i)+0.5*k2,y(i)+0.5*l2);
    l3 = h*f2(x(i)+0.5*k2,y(i)+0.5*l2,z(i)+0.5*m2);
    m3 = h*f3(x(i)+0.5*k2,y(i)+0.5*l2,z(i)+0.5*m2);
    
    k4 = h*f1(x(i)+k3,y(i)+l3);
    l4 = h*f2(x(i)+k3,y(i)+l3,z(i)+m3);
    m4 = h*f3(x(i)+k3,y(i)+l3,z(i)+m3);
    
    x(i+1) = x(i) + (1/6)*(k1+2*k2+2*k3+k4);
    y(i+1) = y(i) + (1/6)*(l1+2*l2+2*l3+l4);
    z(i+1) = z(i) + (1/6)*(m1+2*m2+2*m3+m4);

end

end
