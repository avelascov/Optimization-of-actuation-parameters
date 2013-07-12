% paramJKmin.m is needed. It contains the input
% function out = JKmin_function(in) %the output is J
% syms t
%inputs
function out=JKmin_SEAJ1(in)
t = evalin('base','t');
jn = evalin('base','jn');
%jn= input('insert joint number to analyse: ');

q = in(:,1);
f_hat1 = in(:,2);
Bm = in(:,3:4);
Kmin = in(:,5);
Kmax = in(:,6);
wv = in(:,7);
dq = in(:,8);
ddq = in(:,9);

q1 = eval(q(jn));
f_hat = eval(f_hat1(jn));
B = double(Bm(jn,jn));
Kmin = double(Kmin(jn));
Kmax = double(Kmax(jn));
dq1 = eval(dq(jn));
ddq1 = eval(ddq(jn));

w = double(wv(jn));
Y = 0:(2*pi/w)/1000:2*pi/w;

% q1 is symbolic trajectory, differentiable

dot_f_hat = diff(f_hat);
% dot_f_hat =subs(dot_f_hat, diff(conj(t),t),1);
ddot_f_hat = diff(dot_f_hat);
% ddot_f_hat =subs(dot_f_hat, diff(conj(t),t),1);

% For a fixed cycle
a = B*ddot_f_hat;
b = (B*ddq1 + f_hat);
% c = (B^2*ddq1^2+f_hat^2+ 2*B*ddq1*f_hat);

a_num = (subs(a,t,Y));
b_num = (subs(b,t,Y));
% c_num = (subs(c,t,Y));
% a_num = double(a_num);
% % Coefficients
A  = (trapz(Y,a_num.^2));
Bb  = (trapz(Y,2*a_num.*b_num));
Cc = (trapz(Y,(b_num.^2)));
% D  = (trapz(Y,2*b_num.*c_num));
% E  = (trapz(Y,c_num.^2));

%Calculate J for every K
i=1;
for K=0:0.05:500
J(i) = A/(K^2) + Bb/K + Cc;
Kk(i)=K;
i=i+1;
end

out = [J;Kk];

 