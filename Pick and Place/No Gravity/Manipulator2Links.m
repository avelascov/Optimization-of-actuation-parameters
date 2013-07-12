% clc
% clear all
% close all

% symbolic variables
syms t

%Request for parameters. User defines K range, input trajectories
%  a = input('Insert signal amplitude: '); % vector: a = [a1 a2 a3 a4]
%  a1 = a(1); a2 = a(2); 
% a1 = 1.5; a2 = -3; 
 
% %  w = input('Insert signal frequency: '); % vector: w = [w1 w2 w3 w4]
% %  w1 = w(1); w2 = w(2); 
% w = [10 10];
% w1 = w(1); w2 = w(2); 

%  phi = input('Insert signal phase between 0 and pi rad: '); 
%  phi1 = phi(1); phi2 = phi(2);

phi1 = 0; phi2 = 0;
% link parameters
m = 0.28*3;
m1 = 0.31565836;
m2 = 0.14281236;
g = 9.81*0;
l = 0.055;
l1 = 0.1; %0.14;
l2 = 0.1; %0.165;

% xs = -0.175;  % from -0.25 to 0.05
% ys = sqrt(0.25^2-xs^2);
% xe = 0.15;    % from 0.05 to 0.25
% ye = sqrt(0.25^2-xe^2);

% I1 = m1*((l1/2)^2+(l/2)^2)/12 ;
% I2 = m2*((l/2)^2+(l2/2)^2)/12 ;

I1 = 8.8488347e-3 ;
I2 = 1.4059207e-2;
%I3 = 1.7941252e+04

 I = [I1+I2  I2  ;  I2  I2 ];


% I = [ 1.8315784e+04  2.0269846e+02 -1.5810224e+02;...
%  2.0269846e+02  1.0350626e+04  2.0989469e+03;...
% -1.5810224e+02  2.0989469e+03  1.3038519e+04]*10^-6;

% Kmin = input('Insert K min: '); %vector Kmin = [k1min k2min k3min k4min]
% %k1min = Kmin(1); k2min = Kmin(2); k3min = Kmin(3); k4min = Kmin(4);
% Kmax = input('Insert K max: '); %vector Kmax = [k1max k2max k3max k4max]
% %k1max = Kmax(1); k2max = Kmax(2); k3max = Kmax(3); k4min = Kmin(4);

Kmin = [1 1]*0.1;
Kmax = [1 1]*500;
qemin = -2*pi;
qemax = 2*pi;
%Motor Inertia
Jm1 = 5.55e-7; 
%b_damp1 = 0.064;
Jm2 = 5.55e-7; 
%b_damp2 = 0.0244;

B = diag([Jm1 Jm2 ]);


                    D2s(i) = -(xs^2+ys^2-l1^2-l2^2)/(2*l1*l2);
                    D2e(i) = -(xe^2+ye^2-l1^2-l2^2)/(2*l1*l2);
                    
                    q2scarnot(i,:) = [pi-acos(D2s(i)) -(pi-acos(D2s(i)))]; %elbow down (neg). for elbow up, choose positive sign
                    
                    q2ecarnot(i,:) = [pi-acos(D2e(i)) -(pi-acos(D2e(i)))]; %idem
                    
                    q1scarnot(i,:) = [atan2(ys,xs) - atan((l2*sin(q2scarnot(i,1)))/(l1+l2*cos(q2scarnot(i,1)))) atan2(ys,xs) - atan((l2*sin(q2scarnot(i,2)))/(l1+l2*cos(q2scarnot(i,2))))];
                    q1ecarnot(i,:) = [atan2(ye,xe) - atan((l2*sin(q2ecarnot(i,1)))/(l1+l2*cos(q2ecarnot(i,1)))) atan2(ye,xe) - atan((l2*sin(q2ecarnot(i,2)))/(l1+l2*cos(q2ecarnot(i,2))))];
                    
                   
                    
                    q1diff = [q1scarnot(i,1)-q1ecarnot(i,2) q1scarnot(i,1)-q1ecarnot(i,1) q1scarnot(i,2)-q1ecarnot(i,2) q1scarnot(i,2)-q1ecarnot(i,1)];
                    
                    [value index]=min(q1diff);
                    
                    
                    q1s(i) = q1scarnot(i,ceil(index/2));
                    q1e(i) = q1ecarnot(i,mod(index,2)+1);
                    
                    q2s(i)= q2scarnot(i,ceil(index/2));
                    q2e(i)= q2ecarnot(i,mod(index,2)+1);
   
                    B1(i) = (q1s(i)+q1e(i))/2;
                    A1(i) = (q1s(i)-B1(i));
                    
                    B2(i) = (q2s(i)+q2e(i))/2;
                    A2(i) = (q2s(i)-B2(i));


%desired trajectories
q1 = A1(i)*cos(w1*t) + B1(i);
q2 = A2(i)*cos(w2*t) + B2(i);


dq1 = diff(q1);
dq2 = diff(q2);
ddq1 = diff(dq1);
ddq2 = diff(dq2);

q = [q1; q2 ];
dq = [dq1; dq2 ] ;
ddq = [ddq1; ddq2] ;

% Calculate dynamics
Jv1 = [-l1/2*sin(q1) 0; l1/2*cos(q1) 0; 0 0];
Jv2 = [-l1*sin(q1)-l2/2*sin(q1+q2)  -l2/2*sin(q1+q2) ; l1*cos(q1)+l2/2*cos(q1+q2) l2/2*cos(q1+q2) ; 0 0];

M = (m1)*(Jv1).'*Jv1 + m2*(Jv2).'*Jv2 +  I;

C = [-(m2)*l1*l2/2*sin(q2)*dq2  -m2*l1*l2/2*sin(q2)*(dq1+dq2); (m2)*l1*l2/2*sin(q2)*dq1  0];
G = [(m1*l1/2+ m2*l1)*g*cos(q1)+m2*l2/2*g*cos(q1+q2) ;  m2*l2/2*g*cos(q1+q2)];


f_hat = M*ddq+C*dq+G; %desired dynamics function
dot_f_hat = diff(f_hat);
ddot_f_hat = diff(dot_f_hat);

in = [q f_hat B Kmin' Kmax' w']; %input for the function that finds J* K*
