clc
clear all
close all

l1 = 0.1; %0.14;
l2 = 0.1; %0.165;

xmax = l2+l1/2;
xmin = l1;

ymax = l2;
ymin = l2/2;

i = 1;
%for a=0.5:0.1:1.5   % vary amplitude
for w1= 3:0.5:8  % w1= 3:0.5:21
    for xs =  [-0.12, -0.15]
        for xe = [0.11, 0.14]
            for ys = [0.09, 0.05]
                for ye = [0.07, 0.1]
%                     ys = sqrt(0.17^2-xs^2);
%                     ye = sqrt(0.27^2-xe^2);
                    
                    w2 = w1;
                    w  = [w1 w2];  %equal frecuency for both joints
                    Manipulator2Links  %call file that calculates dynamics
                    in = [q f_hat B Kmin' Kmax' w' dq ddq]; %recalls the input for next function
                                             Y =  0:(2*pi/w1)/1000:2*pi/w1;

                    for jn=1:1:2 %each joint
                        
%                         JK = JKminPEA(in);
                        JK = JKmin_SEA2(in); % calls function that calculates J* and K*
                        JtotK(:, i)=JK(1,:)';
                        [Jmin, Ind] = min(JK(1,:)); %to find J min
                        %saves the minimum J, its corresponding K, and the stiffest case values for each amplitud and each frequency
                         if jn==1  %joint 1  (for more joints, change SWITCH-CASE)
                            mapp1(i,:) = [Jmin A1(i)  w(1) JK(2,Ind) JK(1,end) xe xs ye ys ];
                           
                            theta1 = JK(2,Ind)^-1*f_hat(jn) + q1;
                            theta1_num(i,:) = (subs(theta1,t,Y));
                        
                        else    %joint 2
                            mapp2(i,:) = [Jmin A2(i)  w(1) JK(2,Ind) JK(1,end) xe xs ye ys ];
                            theta2 = JK(2,Ind)^-1*f_hat(jn) + q2;
                            theta2_num(i,:) = (subs(theta2,t,Y));
                        end
                        
                    end
                    i = i+1;
                end
            end
        end
    end
end
% save('dynamPickPlace','f_hat')


save('3_SEAJ2_exp', 'mapp1','mapp2')

save('3_motorpos_exp', 'theta1_num','theta2_num', 'Y')
