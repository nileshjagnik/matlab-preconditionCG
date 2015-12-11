function [x, k] = FDgaussseidel(f, x)
%   Function to iteratively solve an equation using finite difference and
%   Gauss Seidel
    tol = 1e-3
    dim = size(f)
    xold = x
    k = 0
    while abs(norm(f-feval('Au',x))) > abs(norm(f))*tol
        k = k + 1
        xold = x
        for i=2:dim-1
            for j=2:dim-1
                x(i,j) = (f(i,j) + x(i-1,j) + x(i+1,j) + x(i,j-1) + x(i,j+1))/4
            end
        end
        for i = 1:dim
            x(i,1) = f(i,1) + x(i,2)
            if i>1
                x(i,1) = x(i,1) + x(i-1,1) 
            end
            if i<dim
                x(i,1) = x(i,1) + x(i+1,1)
            end
            x(i,1) = x(i,1)/4
            
            x(1,i) = f(1,i) + x(2,i)
            if i>1
                x(1,i) = x(1,i) + x(1,i-1)
            end
            if i<dim
                x(1,i) = x(1,i) + x(1,i+1)
            end
            x(1,i) = x(1,i)/4
            
            x(dim,i) = f(dim,i) + x(dim-1,i)
            if i>1
                x(dim,i) = x(dim,i) + x(dim,i-1) 
            end
            if i<dim
                x(dim,i) = x(dim,i) + x(dim,i+1)
            end
            x(dim,i) = x(dim,i)/4
            
            x(i,dim) = f(i,dim) + x(i,dim-1)
            if i>1
                x(i,dim) = x(i,dim) + x(i-1,dim) 
            end
            if i<dim
                x(i,dim) = x(i,dim) + x(i+1,dim)
            end
            x(i,dim) = x(i,dim)/4
        end
    end
end