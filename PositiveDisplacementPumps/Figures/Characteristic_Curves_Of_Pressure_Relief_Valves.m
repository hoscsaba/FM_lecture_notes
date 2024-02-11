function Characteristic_Curves_Of_Pressure_Relief_Valves

dpset = 0.5;
C1 = 5;
C2 = 2;

dp = 0:0.001:2;

Q2full = C1*(dp-dpset).*sqrt(dp);
Q3full = C2*sqrt(dp);

dpcross = C2/C1 + dpset;

dp1 = 0:0.001:dpset;
Q1  = zeros(length(dp1), 1);
dp2 = dpset:0.001:dpcross;
Q2  = C1*(dp2-dpset).*sqrt(dp2);
dp3 = dpcross:0.001:2;
Q3  = C2*sqrt(dp3);

dpz = [0 1.5];
Qz  = [0 0];

figure(1); hold on;
plot1 = plot(dp,Q2full);
plot2 = plot(dp,Q3full);
plot3 = plot(dp1,Q1);
plot4 = plot(dp2,Q2);
plot5 = plot(dp3,Q3);
plot6 = plot(dpz,Qz);

set(plot1,'LineWidth',2,'Color',[0 0 0]);
set(plot2,'LineWidth',2,'Color',[0 0 0]);
set(plot3,'LineWidth',2,'Color',[1 0 0]);
set(plot4,'LineWidth',2,'Color',[1 0 0]);
set(plot5,'LineWidth',2,'Color',[1 0 0]);
set(plot6,'LineWidth',0.5,'Color',[0 0 0]);
set(gca,'XLim',[0 1.5],'YLim',[-1 3.5],'Box','on');


Qnom  = [1.897 1.897];
dpnom = [0 2];

Qst1  = [0 2.5];
dpst1 = [0.5 0.5];

Qst2  = [1.897 2.5];
dpst2 = [0.9 0.9];

figure(2); hold on;
plot1 = plot(Q1,dp1);
plot2 = plot(Q2,dp2);
plot3 = plot(Q3,dp3);
plot4 = plot(Qnom,dpnom);
plot5 = plot(Qst1,dpst1);
plot6 = plot(Qst2,dpst2);
set(plot1,'LineWidth',2,'Color',[1 0 0]);
set(plot2,'LineWidth',2,'Color',[1 0 0]);
set(plot3,'LineWidth',2,'Color',[1 0 0]);
set(plot4,'LineWidth',1,'LineStyle','--','Color',[0 0 0]);
set(plot5,'LineWidth',0.5,'Color',[0 0 0]);
set(plot6,'LineWidth',0.5,'Color',[0 0 0]);
set(gca,'Box','on');