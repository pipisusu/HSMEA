function [f,g] = WRM(objnum,x)
if nargin <= 1
    prob.nf = 5;
    prob.ng = 7;
    prob.nx = 3;
    range(1,:) = [0.01,0.01,0.01];
    range(2,:) = [0.45,0.10,0.10];
    prob.range = range';
    f = prob;
else
    [f,g] = water_resource_true(x);
end
end

function [f,g] = water_resource_true(x)
f(:,1) = 106780.37 * (x(:,2)+x(:,3)) + 61704.67;
f(:,2) = 3000 * x(:,1);
f(:,3) = 305700 * 2289 * x(:,2) / (0.06 * 2289)^0.65;
f(:,4) = 250 * 2289 * exp(-39.75*x(:,2) + 9.9*x(:,3) + 2.74);
f(:,5) = 25 * ( 1.39./(x(:,1).*x(:,2)) + 4940*x(:,3) - 80);

deno = 1 ./ (x(:,1).*x(:,2));

g(:,1) = -(1.0 - ( 0.00139*deno + 4.94*x(:,3) - 0.08));
g(:,2) = -(1.0 - ( 0.000306*deno + 1.082*x(:,3) - 0.0986));
g(:,3) = -(50000 - ( 12.307*deno + 49408.24*x(:,3) + 4051.02));
g(:,4) = -(16000 - ( 2.098*deno + 8046.33*x(:,3) - 696.71));
g(:,5) = -(10000 - ( 2.138*deno + 7883.39*x(:,3) - 705.04));
g(:,6) = -(2000 - ( 0.417*deno + 1721.26*x(:,3) - 136.54));
g(:,7) = -(550 - ( 0.164*deno + 631.13*x(:,3) - 54.58));
end