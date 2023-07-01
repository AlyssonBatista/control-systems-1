a = [-23.88];                                             
b = [1,6.48,19.54];                                          
rt = tf(a,b);                                          

syms s;                                                 % Symbolic variable
num = a;
den = poly2sym(b,s);
gs = num/den;                                           % Symbolic representation of OLTF

Kp = lim(gs);                                           % Position constant, Kp
Kv = lim(s*gs);                                         % Velocity constant, Kv
Ka = lim(s^2*gs);                                       % Acceleration constant, Ka
fprintf('\nc) Determine the static error constants:\n\t\t Kp = %.3f,\n\t\t Kv = %.3f,\n\t\t Ka = %.3f\n', Kp, Kv, Ka)

checkSystemType(Kp,Kv,Ka);
disp (' ')                                              % New line


%% User-defined functions
function y = lim(f)
syms s;
y = limit(f,s,0);
if isnan(y)
    y = inf;
end
end

function checkSystemType(Kp,Kv,Ka)
if ~isinf(Kp) && Kv == 0 && Ka == 0
    disp('System type: 0');
elseif isinf(Kp) && ~isinf(Kv) && Ka == 0
    disp('System type: 1');
elseif isinf(Kp) && isinf(Kv) && ~isinf(Ka)
    disp('System type: 2');
end
end