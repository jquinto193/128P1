c=0.16+0.59i;          % the value of c, can change it
nx=1001;              % the number of points in x direction
ny=1001;              % the number of points in y direction
ymax=1.5;             % the max y value
xmax=1.5;             % the max x value 
dy=2*ymax/(ny-1);    % step length in y direction
dx=2*xmax/(nx-1);    % step length in x direction
flag=2*ones(nx,ny);  % initialize the colors 
flag((1+nx)/2,(201+ny)/2)=1;
kmax=200;  % number of backward iterations

for k=1:kmax
    flagt=flag;
    flag=2*ones(nx,ny);
    for j=1:nx
        for t=1:ny
            if flagt(j,t)==1  % if the point is colored
                x=(j-1)*dx-xmax;
                y=(t-1)*dy-ymax;
                z=sqrt(x+1i*y-c); % find new point, the function can be modified
                x=real(z);
                y=imag(z);
                if (abs(x)<=xmax)&&(abs(y)<=ymax)
                    flag(round((xmax+x)/dx+1),round((ymax+y)/dy+1))=1; % color one point
                    flag(round((xmax-x)/dx+1),round((ymax-y)/dy+1))=1; % color the other one
                end
            end
        end
    end
end

colormap([1 210/255 210/255; 1 1 1]); % colors
image([-xmax xmax],[-ymax,ymax],flag) % plot the limit set
axis xy
xlabel('x')
ylabel('y')
title(strcat('Boundary of Julia Set for c= ',num2str(c)))
