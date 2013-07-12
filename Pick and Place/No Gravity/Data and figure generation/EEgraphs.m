load EEcoordinates

load 1_data2linksSEAJ1_fitting % J1
i = 468;

% mapp1 [Jmin A1(i)  w(1) Kopt Jstiff xe xs ye ys];
w = mapp1(:,3);
Jmin1 = mapp1(:,1); 
Kopt1 = mapp1(:,4);
Jstiff1 = mapp1(:,5);

Jmin2 = mapp2(:,1); 
Kopt2 = mapp2(:,4);
Jstiff2 = mapp2(:,5);


mapp1o(:,:)= sortrows(mapp1,2);
mapp2o(:,:)= sortrows(mapp2,2);
ind = find(mapp1o(:,2)==A1(i));
ind2 = find(mapp2o(:,2)==A2(i));

 load 2_data2linksPEA1 % J1
 j = 465;
%   [Jmin A1(i)  w(1) qe Jstiff  xe xs ye ys Kopt]
wPEA = mapp1(:,3);
Jmin1PEA = mapp1(:,1); 
Kopt1PEA = mapp1(:,10);
Jstiff1PEA = mapp1(:,5);

Jmin2PEA = mapp2(:,1); 
Kopt2PEA = mapp2(:,10);
Jstiff2PEA = mapp2(:,5);


mapp1oPEA(:,:)= sortrows(mapp1,2);
mapp2oPEA(:,:)= sortrows(mapp2,2);
indPEA = find(mapp1oPEA(:,2)==A1(j));
ind2PEA = find(mapp2oPEA(:,2)==A2(j));

 load 3_dataSEA2links_allw % J2
 ii = 72;
%  mapp1(i,:) = [Jmin A1(i)  w(1) JK(3,Ind) JK(1,end) xe xs ye ys f_hat(jn)];

wSEA = mapp1(:,3);
Jmin1SEA = mapp1(:,1); 
Kopt1SEA = mapp1(:,4);
Jstiff1SEA = mapp1(:,5);

Jmin2SEA = mapp2(:,1); 
Kopt2SEA = mapp2(:,4);
Jstiff2SEA = mapp2(:,5);


mapp1oSEA(:,:)= sortrows(mapp1,2);
mapp2oSEA(:,:)= sortrows(mapp2,2);
indSEA = find(mapp1oSEA(:,2)==A1(ii));
ind2SEA = find(mapp2oSEA(:,2)==A2(ii));

 load 4_dataPEA2links  %J2
 jj = 33;
%  mapp1(i,:) = [Jmin A1(i)  w(1) Kopt Jstiff qe xe xs ye ys f_hat(jn)];

wPEA2 = mapp1(:,3);
Jmin1PEA2 = mapp1(:,1); 
Kopt1PEA2 = mapp1(:,4);
Jstiff1PEA2 = mapp1(:,5);

Jmin2PEA2 = mapp2(:,1); 
Kopt2PEA2 = mapp2(:,4);
Jstiff2PEA2 = mapp2(:,5);


mapp1oPEA2(:,:)= sortrows(mapp1,2);
mapp2oPEA2(:,:)= sortrows(mapp2,2);
indPEA2 = find(mapp1oPEA2(:,2)==A1(jj));
ind2PEA2 = find(mapp2oPEA2(:,2)==A2(jj));


%%%%%%%%%%%%%%%EE TRAJECTORY
l1 = 0.14;
l2 = 0.165;

xmax = l2+l1/2;
xmin = l1;

ymax = l2;
ymin = l2/2;

w1 = w(i);
t = 0:0.005:pi/w1;
w2 = w1;

q1 = A1(i)*cos(w1*t) + B1(i);
q2 = A2(i)*cos(w2*t) + B2(i);

x2 = l1*cos(q1) + l2*cos(q1+q2);
y2 = l1*sin(q1) + l2*sin(q1+q2);


w1PEA = wPEA(j);
t = 0:0.005:pi/w1PEA;
w2PEA = w1PEA;

q1PEA = A1(j)*cos(w1PEA*t) + B1(j);
q2PEA = A2(j)*cos(w2PEA*t) + B2(j);

x2PEA = l1*cos(q1PEA) + l2*cos(q1PEA+q2PEA);
y2PEA = l1*sin(q1PEA) + l2*sin(q1PEA+q2PEA);


w1SEA = wSEA(ii);
t = 0:0.005:pi/w1SEA;
w2SEA = w1SEA;

q1SEA = A1(ii)*cos(w1SEA*t) + B1(ii);
q2SEA = A2(ii)*cos(w2SEA*t) + B2(ii);

x2SEA = l1*cos(q1SEA) + l2*cos(q1SEA+q2SEA);
y2SEA = l1*sin(q1SEA) + l2*sin(q1SEA+q2SEA);



w1PEA2 = wPEA2(jj);
t = 0:0.005:pi/w1PEA2;
w2PEA2 = w1PEA2;

q1PEA2 = A1(jj)*cos(w1PEA2*t) + B1(jj);
q2PEA2 = A2(jj)*cos(w2PEA2*t) + B2(jj);

x2PEA2 = l1*cos(q1PEA2) + l2*cos(q1PEA2+q2PEA2);
y2PEA2 = l1*sin(q1PEA2) + l2*sin(q1PEA2+q2PEA2);


figure
 plot(x2,y2, 'or','LineWidth',2);
hold on
 plot(x2PEA,y2PEA, 'b','LineWidth',2);
hold on
 plot(x2SEA,y2SEA, 'g','LineWidth',2);
hold on
 plot(x2PEA2,y2PEA2, 'k','LineWidth',2);
xlim([-0.2 0.2]) 
ylim([0 0.355]) 
set(gca,'XTick',-0.2:0.05:0.2)
 xlabel('x')
 ylabel('y')
grid on
 w = mapp1o(ind(1):ind(end),3);
 
 % Case 1
 
 J1= mapp1o(ind(1):ind(end),1);
 J2= mapp2o(ind2(1):ind2(end),1);
 Kopt1= mapp1o(ind(1):ind(end),4);
 Kopt2= mapp2o(ind2(1):ind2(end),4);
 figure
  plot(w, J1,'--b', w, J2,'b','LineWidth',2)

title 'SEA J_1 a = -0.1175'
ylabel 'J [J^2]'
 hold on
 plot(w, Kopt1*15,'--g', w, Kopt2*15,'g','LineWidth',2)
 grid on

 % Case 2
 J1P= mapp1oPEA(indPEA(1):indPEA(end),1);
 J2P= mapp2oPEA(ind2PEA(1):ind2PEA(end),1);
 Kopt1P = mapp1oPEA(indPEA(1):indPEA(end),10);
 Kopt2P = mapp2oPEA(ind2PEA(1):ind2PEA(end),10);
figure
plot(w, J1P,'--b', w, J2P,'b','LineWidth',2);
title 'PEA J_1 a = -0.1199'
 xlabel 'w [rad/s]'
 ylabel 'J [J^2]'
 hold on
 plot(w, Kopt1P*7.5,'--g', w, Kopt2P*7.5, 'g','LineWidth',2);
 grid on
 
 % Case 3
 J1S2 = mapp1oSEA(indSEA(1):indSEA(end),1);
 J2S2 =mapp2oSEA(ind2SEA(1):ind2SEA(end),1);
 Kopt1S2 =mapp1oSEA(indSEA(1):indSEA(end),4);
 Kopt2S2 =mapp2oSEA(ind2SEA(1):ind2SEA(end),4);

figure
 plot(w, J1S2,'--b', w,J2S2 ,'b','LineWidth',2);
title 'SEA J_2 a = 0.0255'
 xlabel 'w [rad/s]'
 ylabel 'J [J^2]'

 hold on
 plot(w, Kopt1S2*1/20 ,'--g', w, Kopt2S2*1/20, 'g','LineWidth',2);

 grid on
 
 % case 4
 J1P2 = mapp1oPEA2(indPEA2(1):indPEA2(end),1);
 J2P2 =mapp2oPEA2(ind2PEA2(1):ind2PEA2(end),1);
 Kopt1P2 =mapp1oPEA2(indPEA2(1):indPEA2(end),4);
 Kopt2P2 =mapp2oPEA2(ind2PEA2(1):ind2PEA2(end),4);
 A1(jj)
figure
 plot(w, J1P2, '--b', w, J2P2 , 'b','LineWidth',2);
title 'PEA J_2 a = 0.0228'
 xlabel 'w [rad/s]'
 ylabel 'J [J^2]'
 hold on
 plot(w, Kopt1P2*7 , '--g',w, Kopt2P2*7, 'g','LineWidth',2);
 grid on


 
 