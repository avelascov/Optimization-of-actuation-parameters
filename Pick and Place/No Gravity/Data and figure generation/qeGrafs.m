load EEcoordinates

load 1_data2linksSEAJ1a % J1
i = 468;
mapp1o(:,:)= sortrows(mapp1,2);
mapp2o(:,:)= sortrows(mapp2,2);
ind = find(mapp1o(:,2)==A1(i));
ind2 = 482:518;

 load 2_data2linksPEA1ap % J1
%  j = 465;
%   [Jmin A1(i)  w(1) qe Jstiff  xe xs ye ys Kopt]
mapp1oPEA(:,:)= sortrows(mapp1,2);
mapp2oPEA(:,:)= sortrows(mapp2,2);
indPEA = find(mapp1oPEA(:,2)==A1(i));
ind2PEA = 482:518;

 load 3_dataSEA2links_allwa % J2
%  ii = 72;
%  mapp1(i,:) = [Jmin A1(i)  w(1) JK(3,Ind) JK(1,end) xe xs ye ys f_hat(jn)];
mapp1oSEA(:,:)= sortrows(mapp1,2);
mapp2oSEA(:,:)= sortrows(mapp2,2);
indSEA = find(mapp1oSEA(:,2)==A1(i));
ind2SEA = 482:518;

 load 4_dataPEA2linksJ1ap  %J2
%  jj = 33;
%  mapp1(i,:) = [Jmin A1(i)  w(1) Kopt Jstiff qe xe xs ye ys f_hat(jn)];
mapp1oPEA2(:,:)= sortrows(mapp1,2);
mapp2oPEA2(:,:)= sortrows(mapp2,2);
indPEA2 = find(mapp1oPEA2(:,2)==A1(i));
ind2PEA2 =  482:518;

 w = mapp1o(ind(1):ind(end),3);

qe1PEA1 = mapp1oPEA(indPEA(1):indPEA(end),10);
qe1PEA2 = mapp2oPEA(ind2PEA(1):ind2PEA(end),10);

qe2PEA1 = mapp1oPEA2(indPEA2(1):indPEA2(end),10);
qe2PEA2 = mapp2oPEA2(ind2PEA2(1):ind2PEA2(end),10);


figure
subplot(4,1,1)
plot(w, qe1PEA1, '--r', w, qe2PEA1, '*r', w, qe1PEA2, '+b', w, qe2PEA2, 'b', 'LineWidth',2.5)
% xlabel ('w [rad]','Color','k','FontSize', 14, 'fontweight','b')
% ylabel ('q_e [Nm/rad]', 'FontSize', 14,'fontweight','b')
title ('Case a.', 'FontSize', 14,'fontweight','b')
set(gca,  'FontSize',14, 'fontweight', 'b')
grid on


load 1_data2linksSEAJ1a % J1
i = 465;
mapp1o(:,:)= sortrows(mapp1,2);
mapp2o(:,:)= sortrows(mapp2,2);
ind = find(mapp1o(:,2)==A1(i));
ind2 = 556:592;

 load 2_data2linksPEA1ap % J1
%  j = 465;
%   [Jmin A1(i)  w(1) qe Jstiff  xe xs ye ys Kopt]
mapp1oPEA(:,:)= sortrows(mapp1,2);
mapp2oPEA(:,:)= sortrows(mapp2,2);
indPEA = find(mapp1oPEA(:,2)==A1(i));
ind2PEA = 556:592;

 load 3_dataSEA2links_allwa % J2
%  ii = 72;
%  mapp1(i,:) = [Jmin A1(i)  w(1) JK(3,Ind) JK(1,end) xe xs ye ys f_hat(jn)];
mapp1oSEA(:,:)= sortrows(mapp1,2);
mapp2oSEA(:,:)= sortrows(mapp2,2);
indSEA = find(mapp1oSEA(:,2)==A1(i));
ind2SEA = 556:592;

 load 4_dataPEA2linksJ1ap  %J2
%  jj = 33;
%  mapp1(i,:) = [Jmin A1(i)  w(1) Kopt Jstiff qe xe xs ye ys f_hat(jn)];
mapp1oPEA2(:,:)= sortrows(mapp1,2);
mapp2oPEA2(:,:)= sortrows(mapp2,2);
indPEA2 = find(mapp1oPEA2(:,2)==A1(i));
ind2PEA2 = 556:592;

qe1PEA1 = mapp1oPEA(indPEA(1):indPEA(end),10);
qe1PEA2 = mapp2oPEA(ind2PEA(1):ind2PEA(end),10);

qe2PEA1 = mapp1oPEA2(indPEA2(1):indPEA2(end),10);
qe2PEA2 = mapp2oPEA2(ind2PEA2(1):ind2PEA2(end),10);

subplot(4,1,2)
plot(w, qe1PEA1, '--r', w, qe2PEA1, '*r', w, qe1PEA2, '+b', w, qe2PEA2, 'b', 'LineWidth',2.5)
% legend('q_{e_{1,1}}','q_{e_{1,2}}','q_{e_{2,1}}', 'q_{e_{2,2}}')
% xlabel ('w [rad]','Color','k','FontSize', 14, 'fontweight','b')
% ylabel ('q_e [Nm/rad]', 'FontSize', 14,'fontweight','b')
title ('Case b.', 'FontSize', 14,'fontweight','b')
set(gca,  'FontSize',14, 'fontweight', 'b')
grid on


load 1_data2linksSEAJ1a % J1
i = 72;
mapp1o(:,:)= sortrows(mapp1,2);
mapp2o(:,:)= sortrows(mapp2,2);
ind = find(mapp1o(:,2)==A1(i));
ind2 = find(mapp2o(:,2)==A2(i));

 load 2_data2linksPEA1ap % J1
%  j = 465;
%   [Jmin A1(i)  w(1) qe Jstiff  xe xs ye ys Kopt]
mapp1oPEA(:,:)= sortrows(mapp1,2);
mapp2oPEA(:,:)= sortrows(mapp2,2);
indPEA = find(mapp1oPEA(:,2)==A1(i));
ind2PEA = find(mapp2oPEA(:,2)==A2(i));

 load 3_dataSEA2links_allwa % J2
%  ii = 72;
%  mapp1(i,:) = [Jmin A1(i)  w(1) JK(3,Ind) JK(1,end) xe xs ye ys f_hat(jn)];
mapp1oSEA(:,:)= sortrows(mapp1,2);
mapp2oSEA(:,:)= sortrows(mapp2,2);
indSEA = find(mapp1oSEA(:,2)==A1(i));
ind2SEA = find(mapp2oSEA(:,2)==A2(i));

 load 4_dataPEA2linksJ1ap  %J2
%  jj = 33;
%  mapp1(i,:) = [Jmin A1(i)  w(1) Kopt Jstiff qe xe xs ye ys f_hat(jn)];
mapp1oPEA2(:,:)= sortrows(mapp1,2);
mapp2oPEA2(:,:)= sortrows(mapp2,2);
indPEA2 = find(mapp1oPEA2(:,2)==A1(i));
ind2PEA2 = find(mapp2oPEA2(:,2)==A2(i));

qe1PEA1 = mapp1oPEA(indPEA(1):indPEA(end),10);
qe1PEA2 = mapp2oPEA(ind2PEA(1):ind2PEA(end),10);

qe2PEA1 = mapp1oPEA2(indPEA2(1):indPEA2(end),10);
qe2PEA2 = mapp2oPEA2(ind2PEA2(1):ind2PEA2(end),10);


subplot(4,1,3)
plot(w, qe1PEA1, '--r', w, qe2PEA1, '*r', w, qe1PEA2, '+b', w, qe2PEA2, 'b', 'LineWidth',2.5)
% legend('q_{e_{1,1}}','q_{e_{1,2}}','q_{e_{2,1}}', 'q_{e_{2,2}}')
% xlabel ('w [rad]','Color','k','FontSize', 14, 'fontweight','b')
title ('Case c.', 'FontSize', 14,'fontweight','b')
ylabel ('q_e [Nm/rad]', 'FontSize', 14,'fontweight','b')
set(gca,  'FontSize',14, 'fontweight', 'b')
grid on

load 1_data2linksSEAJ1a % J1
i = 33;
% i=468
mapp1o(:,:)= sortrows(mapp1,2);
mapp2o(:,:)= sortrows(mapp2,2);
ind = find(mapp1o(:,2)==A1(i));
ind2 = 408:444;

 load 2_data2linksPEA1ap % J1
 %j= 465
%   [Jmin A1(i)  w(1) qe Jstiff  xe xs ye ys Kopt]
mapp1oPEA(:,:)= sortrows(mapp1,2);
mapp2oPEA(:,:)= sortrows(mapp2,2);
indPEA = find(mapp1oPEA(:,2)==A1(i));
ind2PEA = 408:444;

 load 3_dataSEA2links_allwa % J2
%  ii = 72;
%  mapp1(i,:) = [Jmin A1(i)  w(1) JK(3,Ind) JK(1,end) xe xs ye ys f_hat(jn)];
mapp1oSEA(:,:)= sortrows(mapp1,2);
mapp2oSEA(:,:)= sortrows(mapp2,2);
indSEA = find(mapp1oSEA(:,2)==A1(i));
ind2SEA = 408:444;

 load 4_dataPEA2linksJ1ap  %J2
%  jj = 33;
%  mapp1(i,:) = [Jmin A1(i)  w(1) Kopt Jstiff qe xe xs ye ys f_hat(jn)];
mapp1oPEA2(:,:)= sortrows(mapp1,2);
mapp2oPEA2(:,:)= sortrows(mapp2,2);
indPEA2 = find(mapp1oPEA2(:,2)==A1(i));
ind2PEA2 = 408:444;

qe1PEA1 = mapp1oPEA(indPEA(1):indPEA(end),10);
qe1PEA2 = mapp2oPEA(ind2PEA(1):ind2PEA(end),10);

qe2PEA1 = mapp1oPEA2(indPEA2(1):indPEA2(end),10);
qe2PEA2 = mapp2oPEA2(ind2PEA2(1):ind2PEA2(end),10);


subplot(4,1,4)
plot(w, qe1PEA1, '--r', w, qe2PEA1, '*r', w, qe1PEA2, '+b', w, qe2PEA2, 'b', 'LineWidth',2.5)
% legend('q_{e_{1,1}}','q_{e_{1,2}}','q_{e_{2,1}}', 'q_{e_{2,2}}')
xlabel ('w [rad]','Color','k','FontSize', 14, 'fontweight','b')
% ylabel ('q_e [Nm/rad]', 'FontSize', 14,'fontweight','b')
title ('Case d.', 'FontSize', 14,'fontweight','b')
set(gca,  'FontSize',14, 'fontweight', 'b')
grid on
