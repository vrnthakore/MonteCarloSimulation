clc;
clear;

% Sampling 10,000 initial conditions
R = mvnrnd([1 1 1],eye(3),10000);

% Simulate ODEs with each initial condition
for i = 1:length(R)
    [x(i,:),y(i,:),z(i,:),t] = rk4(R(i,:));

end

% M is a matrix containig x, y and z values at timesteps t=0, t=10 and t=40 
M = [x(:,1) x(:,1001) x(:,4001) y(:,1) y(:,1001) y(:,4001)];
M(:,:,2) = [y(:,1) y(:,1001) y(:,4001) z(:,1) z(:,1001) z(:,4001)];
M(:,:,3) = [x(:,1) x(:,1001) x(:,4001) z(:,1) z(:,1001) z(:,4001)];

% Estimation of pairwise joint PDF and Plotting of pairwise joint PDF
for j = 1:3
    
    for k = 1:3
        
        % Estimation of probability density function from the data in matrix a
        a = [M(:,k,j) M(:,k+3,j)];
        [fi,xi] = ksdensity(a);
        
        % Plotting of pairwise joint PDF
        xv = linspace(min(xi(:,1)), max(xi(:,1)), 50);
        yv = linspace(min(xi(:,2)), max(xi(:,2)), 50);
        [Xp(:,:,k),Yp(:,:,k)] = meshgrid(xv, yv);
        Zp(:,:,k) = griddata(xi(:,1),xi(:,2),fi,Xp(:,:,k),Yp(:,:,k));
        figure;
        mesh(Xp(:,:,k),Yp(:,:,k),Zp(:,:,k));
        
    end
    
end

% Label all the figures
figure(1);
xlabel('x');
ylabel('y');
zlabel('PDF(X,Y)');
title('Joint PDF of X and Y at t=0');

figure(2);
xlabel('x');
ylabel('y');
zlabel('PDF(X,Y)');
title('Joint PDF of X and Y at t=10');

figure(3);
xlabel('x');
ylabel('y');
zlabel('PDF(X,Y)');
title('Joint PDF of X and Y at t=40');
 
 
figure(4);
xlabel('y');
ylabel('z');
zlabel('PDF(Y,Z)');
title('Joint PDF of Y and Z at t=0');

figure(5);
xlabel('y');
ylabel('z');
zlabel('PDF(Y,Z)');
title('Joint PDF of Y and Z at t=10');

figure(6);
xlabel('y');
ylabel('z');
zlabel('PDF(Y,Z)');
title('Joint PDF of Y and Z at t=40');


figure(7);
xlabel('x');
ylabel('z');
zlabel('PDF(X,Z)');
title('Joint PDF of X and Z at t=0');

figure(8);
xlabel('x');
ylabel('z');
zlabel('PDF(X,Z)');
title('Joint PDF of X and Z at t=10');

figure(9);
xlabel('x');
ylabel('z');
zlabel('PDF(X,Z)');
title('Joint PDF of X and Z at t=40');