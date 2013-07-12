%inputs
function out=JKminPEAJ2(in)
t = evalin('base','t');
jn = evalin('base','jn');
qemin = evalin('base','qemin');
qemax = evalin('base','qemax');
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
% ddq1 = eval(ddq(jn));

w = double(wv(jn));
% T = 2*pi/w;
Y = 0:(2*pi/w)/1000:2*pi/w;

% q1 is symbolic trajectory, differentiable

% dot_f_hat = diff(f_hat);
% dot_f_hat =subs(dot_f_hat, diff(conj(t),t),1);
% ddot_f_hat = diff(dot_f_hat);
% % ddot_f_hat =subs(dot_f_hat, diff(conj(t),t),1);

% For a fixed cycle
a = (f_hat);
b = (q1);
% c = (B*ddq1*dq1+f_hat*dq1);

 
a_num = (subs(a,t,Y));
b_num = (subs(b,t,Y));
c_num = subs(dq1,t,Y);
% b_num = (subs(b,t,Y));
% c_num = (subs(c,t,Y));
% a_num = double(a_num);
% % Coefficients
A  = (trapz(Y,a_num.^2.*c_num.^2));
Bb  = (trapz(Y,c_num.^2));
Cc = (trapz(Y,(c_num.^2.*b_num.^2)));
D  = (trapz(Y,2*c_num.^2.*b_num));
E  = (trapz(Y,2*a_num.*c_num.^2));
F = (trapz(Y,2*a_num.*b_num.*c_num.^2 ));

% i=1; j =1;
% 
K_vect = Kmin(1):0.1:Kmax(1);
qe_vect = qemin(1):0.05:qemax(1);

% K_vect = Kmin(1):10:Kmax(1);
% qe_vect = qemin(1):1:qemax(1);

JJ_test = zeros(length(qe_vect),length(K_vect));

for j = 1:length(K_vect)
    Kv = K_vect(j);
    for i = 1:length(qe_vect)
        qev = qe_vect(i);
    JJ_test(i,j) = A + Kv.^2*qev^2.*Bb + Kv.^2.*Cc -Kv.^2*qev.*D - Kv.*qev.*E + Kv.*F;
    end
end

% 
% for Kv = Kmin(1):0.1:Kmax(1)
%     for qev = qemin(1):0.05:qemax(1)
%  JJ_test(i,j) = A + Kv.^2*qev^2.*Bb + Kv.^2.*Cc -Kv.^2*qev.*D - Kv.*qev.*E + Kv.*F;        
%         qe(i) = qev;  
%        
%         i=i+1;
%     end
%     
%     K(j) = Kv;
%     j=j+1;
% end


 JJ_stiff = A ;
 
[JJ Ind] = min(JJ_test);
[minJJ Ind2] = min(JJ);
Kk = K_vect(Ind2);
 qqe =qe_vect(Ind(Ind2));

out = [minJJ; Kk; qqe; JJ_stiff];


% qev = [qemin qemax qeopt];
% Kv = [Kmin Kmax Kopt];
% 
% JJ_test = zeros(length(qev),length(Kv));
% 
% for i=1:length(qev)
% 
%     JJ_test(i,:) = A - Kv.*qev(i).*Bb + Kv.*Cc + Kv.^2*qev(i)^2*T + Kv.^2.*D- Kv.^2*qev(i)*E ;
%     
% end





% % qeopt = (Bb+Kopt*E)/(2*Kopt*T);
% % Kopt = (2*T*Cc - Bb*E)/(-4*T*D+E^2);
% Kopt =(2*Bb*F+E*D)/(D^2-4*Bb*Cc);
% 
% 
% 
% if Kopt < Kmin
%     Kopt = Kmin;
% elseif Kopt > Kmax
%     Kopt = Kmax;
% end
% 
% 
% 
% qeopt = (E-D*Kopt)/(2*Kopt*Bb);
% 
% if qeopt < qemin
%     qeopt = qemin;
% elseif qeopt > qemax
%     qeopt = qemax;
% end
% 
% qev = [qemin qemax qeopt];
% Kv = [Kmin Kmax Kopt];
% 
% JJ_test = zeros(length(qev),length(Kv));
% 
% for i=1:length(qev)
% 
%     JJ_test(i,:) = A + Kv.^2*qev(i)^2.*Bb + Kv.^2.*Cc -Kv.^2*qev(i).*D - Kv.*qev(i).*E + Kv.*F;
%     
% end
% 
%  JJ_stiff = A ;
%  
% [JJ Ind] = min(min(JJ_test));
% K = Kv(Ind);
% qe =qev(Ind);
% out = [JJ; K; qe; JJ_stiff];

%save('res','Kv','JJ_test','qev');


% f =JJ;
% %Calculate J for every K
% i=1;
% for K=Kmin:10:Kmax
% J(i) = A/(K^4) + Bb/(K^3) + Cc/(K^2) +D/K + E;
% J_A(i) = 1/(K^4) + Bb/(A*(K^3)) + Cc/(A*(K^2)) +D/(A*K) + E/A;
% Kk(i)=K;
% i=i+1;
% end
% out = [J;J_A;Kk];

 