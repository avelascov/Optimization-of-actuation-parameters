

load EEcoordinates

load 1_data2linksSEAJ1 % J1
i = 465;
mapp1o(:,:)= sortrows(mapp1,2);
mapp2o(:,:)= sortrows(mapp2,2);
ind = find(mapp1o(:,2)==A1(i));
ind2 = 556:592;

 load 2_data2linksPEA1 % J1
%  j = 465;
%   [Jmin A1(i)  w(1) qe Jstiff  xe xs ye ys Kopt]
mapp1oPEA(:,:)= sortrows(mapp1,2);
mapp2oPEA(:,:)= sortrows(mapp2,2);
indPEA = find(mapp1oPEA(:,2)==A1(i));
ind2PEA = 556:592;

 load 3_dataSEA2links_allw % J2
%  ii = 72;
%  mapp1(i,:) = [Jmin A1(i)  w(1) JK(3,Ind) JK(1,end) xe xs ye ys f_hat(jn)];
mapp1oSEA(:,:)= sortrows(mapp1,2);
mapp2oSEA(:,:)= sortrows(mapp2,2);
indSEA = find(mapp1oSEA(:,2)==A1(i));
ind2SEA = 556:592;

 load 4_dataPEA2linksJ1  %J2
%  jj = 33;
%  mapp1(i,:) = [Jmin A1(i)  w(1) Kopt Jstiff qe xe xs ye ys f_hat(jn)];
mapp1oPEA2(:,:)= sortrows(mapp1,2);
mapp2oPEA2(:,:)= sortrows(mapp2,2);
indPEA2 = find(mapp1oPEA2(:,2)==A1(i));
ind2PEA2 = 556:592;

 w = mapp1o(ind(1):ind(end),3);


J1S1 = mapp1o(ind(1):ind(end),1);
 J1S2 = mapp2o(ind2(1):ind2(end),1);
 J2S1 = mapp1oSEA(indSEA(1):indSEA(end),1);
 J2S2 = mapp2oSEA(ind2SEA(1):ind2SEA(end),1);
 J1P1 = mapp1oPEA(indPEA(1):indPEA(end),1);
 J1P2 = mapp2oPEA(ind2PEA(1):ind2PEA(end),1);
 J2P1 = mapp1oPEA2(indPEA2(1):indPEA2(end),1);
 J2P2 = mapp2oPEA2(ind2PEA2(1):ind2PEA2(end),1);
 J1SS1  = mapp1o(ind(1):ind(end),5);
 J1SS2  = mapp2o(ind2(1):ind2(end),5);
 J1SP1  = mapp1oPEA(indPEA(1):indPEA(end),5);
 J1SP2  = mapp2oPEA(ind2PEA(1):ind2PEA(end),5);
 J2SS1  = mapp1oSEA(indSEA(1):indSEA(end),5);
 J2SS2  = mapp2oSEA(ind2SEA(1):ind2SEA(end),5);
 J2SP1  = mapp1oPEA2(indPEA2(1):indPEA2(end),5);
 J2SP2  = mapp2oPEA2(ind2PEA2(1):ind2PEA2(end),5);
J1totSEA = J1S1+J1S2;
J1totPEA = J1P1+J1P2;
J2totSEA = J2S1+J2S2;
J2totPEA = J2P1+J2P2;
J1stiffSEA = J1SS1+J1SS2;
J2stiffSEA = J2SS1+J2SS2;
J1stiffPEA = J1SP1+J1SP2;
J2stiffPEA = J2SP1+J2SP2;

%title '(A_1 = -0.12, A_2 = 1.57; B_1 = 1.62  B_2 = -0.08 )'
figure
plot(w,J1totSEA,'r', w, J1totPEA, '--r',  w, J2totSEA, 'b', w, J2totPEA, '--b', w, J1stiffPEA, '.-m', 'LineWidth',2.5)
% legend('J_1 SEA','J_1 PEA','J_2 SEA', 'J_2 PEA','J_1 Stiff ',  'J_2 Stiff ' )
ylabel ('J [J^2]', 'FontSize', 14,'fontweight','b')
set(gca,  'FontSize',14, 'fontweight', 'b')
grid on

figure
plot( w, J2stiffPEA, '.-g','LineWidth',2.5 )
set(gca,  'FontSize',14, 'fontweight', 'b')
grid on

% figure
% plot(w, J2stiffSEA, ':g', 'LineWidth',2.5)
% xlabel ('w [rad]','FontSize', 12, 'fontweight','b')
% ylabel ('J [J^2]', 'FontSize', 12, 'fontweight','b')
% set(gca,  'FontSize',12, 'fontweight', 'b')
% grid on


KJ1SEA1 = mapp1o(ind(1):ind(end),4);
KJ1SEA2 = mapp2o(ind2(1):ind2(end),4);
KJ2SEA1 = mapp1oSEA(indSEA(1):indSEA(end),4);
KJ2SEA2 = mapp2oSEA(ind2SEA(1):ind2SEA(end),4);
KJ1PEA1 = mapp1oPEA(indPEA(1):indPEA(end),10);
KJ1PEA2 = mapp2oPEA(ind2PEA(1):ind2PEA(end),10);
KJ2PEA1 = mapp1oPEA2(indPEA2(1):indPEA2(end),4);
KJ2PEA2 = mapp2oPEA2(ind2PEA2(1):ind2PEA2(end),4);

figure
plot(w, KJ1SEA1, 'r', w, KJ1SEA2,'--r', w, KJ2SEA2, '--b',w, KJ1PEA1, ':m',w, KJ1PEA2, '.-m',w, KJ2PEA1, ':g',w, KJ2PEA2,'.-g','LineWidth',2.5)
% legend('K_{1,1} SEA','K_{1,2} SEA', 'K_{2,2} SEA','K_{1,1} PEA','K_{1,2} PEA','K_{2,1} PEA', 'K_{2,2} PEA' )
xlabel ('w [rad]','Color','k','FontSize', 14, 'fontweight','b')
ylabel ('K [Nm/rad]', 'FontSize', 14,'fontweight','b')
set(gca,  'FontSize',14, 'fontweight', 'b')
% set(gca, 'XColor', 'r', 'YColor', 'r', 'FontSize',12, 'fontweight', 'b')
% axes;
% set(gca,'Color','r')
grid on

figure
plot(w, KJ2SEA1, 'b', 'LineWidth',2.5)
xlabel ('w [rad]','FontSize', 14,'fontweight','b')
set(gca,  'FontSize',14, 'fontweight', 'b')
grid on

