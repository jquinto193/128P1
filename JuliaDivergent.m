M=100;                % define criterion of "divergent"
c=0.16+0.65i;          % the value of c, can change it
nx=1001;              % the number of points in x direction
ny=1001;              % the number of points in y direction
ymax=1.5;             % the max y value
xmax=1.5;             % the max x value 
dy=2*ymax/(ny-1);    % step length in y direction
dx=2*xmax/(nx-1);    % step length in x direction

imax = 50; % maximum number of iterations
iters=imax*ones(nx,ny);  % initialize the number of iterations to infinity

for i=1:nx
    for j=1:ny
        x=(i-1)*dx-xmax;
        y=(j-1)*dy-ymax;
        z=x+1i*y;
        count = 0;
        while (abs(z)<=M)&&(count<imax)
            z=z*z+c;
            count=count+1;
        end
        iters(i,j)=count;
    end
end
nc = max(max(iters)); % number of different colors
colors = [linspace(0,1,nc); linspace(1,0.5,nc); linspace(0.5,1,nc)]'; % coloring
colormap(colors);
image([-xmax xmax],[-ymax,ymax],iters) % plot the limit set
axis xy
xlabel('x')
ylabel('y')
title(strcat('Divergence for c= ',num2str(c),' and M=',num2str(M)))