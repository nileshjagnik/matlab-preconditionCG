dim = 4
f = zeros(dim, dim)
u = zeros(dim, dim)
x = zeros(dim, dim)

for i = 1:dim
    for j = 1:dim
        f(i,j) = -2*pi*(i/(dim+1)*sin(pi*i/(dim+1))*cos(pi*j/(dim+1)) + j/(dim+1)*sin(pi*j/(dim+1))*(cos(pi*i/(dim+1))-pi*i/(dim+1)*sin(pi*i/(dim+1)))) * 1/((dim+1)^2)
        %f(i,j)= 2*pi*pi*sin(pi*i/(dim+1))*sin(pi*j/(dim+1)) * 1/((dim+1)^2)
        u(i,j) = i/(dim+1)*j/(dim+1)*sin(pi*i/(dim+1))*sin(pi*j/(dim+1))
        %u(i,j) = sin(pi*i/(dim+1))*sin(pi*j/(dim+1))
        x(i,j) = 0
    end
end

[z, k] = conjgrad(f,x)
%disp(f)
%disp(det(f))

%f1 = [-2965.04, -2410.32, 7893.51, -6891.18; -2410.32, 8300.81, -8288.76, 3939.64; 7893.51, -8288.76, 4.92589, 4727.71; -6891.18, 3939.64, 4727.71, -7197.45]
%z = z*f1


dim = dim*dim
f = zeros(dim, dim)
u = zeros(dim, dim)
x = zeros(dim, dim)
y = zeros(dim, dim)


for i = 1:dim
    for j = 1:dim
        f(i,j) = -2*pi*(i/(dim+1)*sin(pi*i/(dim+1))*cos(pi*j/(dim+1)) + j/(dim+1)*sin(pi*j/(dim+1))*(cos(pi*i/(dim+1))-pi*i/(dim+1)*sin(pi*i/(dim+1)))) * 1/((dim+1)^2)
        %f(i,j)= 2*pi*pi*sin(pi*i/(dim+1))*sin(pi*j/(dim+1)) * 1/((dim+1)^2)
        u(i,j) = i/(dim+1)*j/(dim+1)*sin(pi*i/(dim+1))*sin(pi*j/(dim+1))
        %u(i,j) = sin(pi*i/(dim+1))*sin(pi*j/(dim+1))
        
        %I committed a crime - hard coded for dim = 16
        if i <= sqrt(dim)
            a = 1
        elseif i <= 2 * sqrt(dim)
            a = 2
        elseif i <= 3 * sqrt(dim)
            a = 3
        else
            a = 4
        end
        
        %I committed a crime - hard coded for dim = 16
        if j <= sqrt(dim)
            b = 1
        elseif j <= 2 * sqrt(dim)
            b = 2
        elseif j <= 3 * sqrt(dim)
            b = 3
        else
            b = 4
        end
        x(i,j) = z(a,b)
        y(i,j) = 0
    end
end

%[z, k, res1] = PCconjgrad(f,y,x/100)
%[z, k, res2] = conjgrad(f,y)
%disp(abs(norm(res1)))
%disp(abs(norm(res2)))

figure
surf(x)