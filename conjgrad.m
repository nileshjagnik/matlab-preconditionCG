function [x,k,r] = conjgrad(b,x)
    % Function that implements comjugate gradient method
    % From slides
    r = b - feval('Au',x)
    rhoOld = norm(r'*r)
    rhoNew = rhoOld
    k = 0
    eps = 1.0e-10
    
    while (sqrt(rhoNew)> norm(b)*eps) && (norm(r)>norm(b)*eps)  && (k< 2*length(b))
        if k == 0
            p = r
        else
            beta = rhoNew/rhoOld
            p = r + beta*p
        end
        w = feval('Au',p)
        alpha = rhoNew/norm(p'*w)
        x = x + alpha*p
        r = r - alpha*w
        rhoOld = rhoNew
        rhoNew = norm(r'*r)
        k = k + 1
    end
end