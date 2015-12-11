function [x, k, r] = PCconjgrad(b, x, pc)
% Preconditioned Conjugate Gradient
% http://stanford.edu/class/ee364b/lectures/conj_grad_slides.pdf
    r = b - feval('Au',x)
    p = r
    z = pc*r
    rhoOld = norm(r'*z)
    rhoNew = rhoOld
    eps = 1.0e-10
    k = 0
    while (sqrt(abs(rhoNew))> abs(norm(b))*eps) && (abs(norm(r))>abs(norm(b))*eps) && (k< 4*length(b))
        w = feval('Au',p)
        alpha = rhoNew/norm(p'*w)
        x = x + alpha*p
        r = r - alpha*w
        z = pc*r
        rhoOld = rhoNew
        rhoNew = norm(z'*r)
        beta = rhoNew/rhoOld
        p = r + beta*p
        k = k + 1
    end
end