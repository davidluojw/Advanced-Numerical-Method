function [p1,err,k,y]=secant(f,p0,p1,delta,epsilon,max1)
%Input - f is the object function input as a string ’f’
%- p0 and p1 are the initial approximations to a zero
%- delta is the tolerance for p1
%- epsilon is the tolerance for the function values y
%- max1 is the maximum number of iterations
%Output - p1 is the secant method approximation to the zero
%- err is the error estimate for p1
%- k is the number of iterations
%- y is the function value f(p1)
for k=1:max1
    
    p2=p1-feval(f,p1)*(p1-p0)/(feval(f,p1)-feval(f,p0));
    err=abs(p2-p1);
    relerr=2*err/(abs(p2)+delta);
    p0=p1;
    p1=p2;
    y=feval(f,p1);
    if (err<delta)||(relerr<delta)||(abs(y)<epsilon)
        break;
    end
end