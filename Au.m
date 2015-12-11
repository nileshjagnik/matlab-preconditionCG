function [y] = Au(u)
%Au - Function to get value of Au for any matrix u as input
    dim = size(u)
    y = u
    i = 2:dim-1
    j = 2:dim-1
    y(i,j) = 4*u(i,j) - u(i-1,j) - u(i+1,j) - u(i,j-1) - u(i,j+1)
    
    %Corner Cases
    for i = 1:dim
        y(1,i) = 4*u(1,i) - u(2,i)
        if i>1
            y(1,i) = y(1,i) - u(1,i-1)
        end
        if i<dim
            y(1,i) = y(1,i) - u(1,i+1)
        end
        
        y(i,1) = 4*u(i,1) - u(i,2)
        if i>1
            y(i,1) = y(i,1) - u(i-1,1)
        end
        if i<dim
            y(i,1) = y(i,1) - u(i+1,1)
        end
        
        y(dim,i) = 4*u(dim,i) - u(dim-1,i)
        if i>1
            y(dim,i) = y(dim,i) - u(dim,i-1)
        end
        if i<dim
            y(dim,i) = y(dim,i) - u(dim,i+1)
        end
        
        y(i,dim) = 4*u(i,dim) - u(i,dim-1)
        if i>1
            y(i,dim) = y(i,dim) - u(i-1,dim)
        end
        if i<dim
            y(i,dim) = y(i,dim) - u(i+1,dim)
        end
    end
end