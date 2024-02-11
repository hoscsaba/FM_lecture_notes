% pump_curve_fig
clear all
close all
clc

Q1 = linspace(0,0.03);
H1 = 70 - 5e4*Q1.^2;
Hcs = 15 + 6e4*Q1.^2;

Hpfun = @(x)interp1(Q1,H1,x,'spline');
Hcsfun = @(x)interp1(Q1,Hcs,x,'spline');
Qmp = fsolve(@(x) (Hpfun(x) - Hcsfun(x)), 10)
Hmp = Hpfun(Qmp)


lwidth = 1.4;
figure;
plot(Q1,H1,'LineWidth',lwidth);
hold on;
plot(Q1,Hcs,'LineWidth',lwidth);
plot(Qmp,Hmp,'Marker','o','MarkerSize',9,'LineWidth',lwidth,'Color','k');
grid on;
% quiver(Qmp,Hmp,0,-Hmp,'Color','k','LineStyle','--','AutoScale','off','MaxHeadSize',0.001,'MarkerSize',12);
% quiver(Qmp,Hmp,-Qmp,0,'Color','k','LineStyle','--','AutoScale','off','MaxHeadSize',0.001);
arrow([Qmp,Hmp],[Qmp,0],'LineStyle','--','LineWidth',0.8);
arrow([Qmp,Hmp],[0,Hmp],'LineStyle','--','LineWidth',0.8);



plotepsx = 2e-3;
plotepsy = 5;
text(0 - plotepsx,Hmp,'H_p','FontSize',12);
text(0 - plotepsx - 1e-3,Hcs(1),'H_{stat}','FontSize',12);
text(Qmp,0 - plotepsy,'Q_{p}','FontSize',12);
% text(Qmp,0,'Q_{p}');
% drawbrace([Qmp,Hcs(1)],[Qmp,Hmp],10);
plot([0,Qmp],[Hcs(1),Hcs(1)],'LineStyle','--','LineWidth',0.8,'Color','k');
bracelineh = drawbrace([Qmp,Hmp],[Qmp,Hcs(1)],10);
set(bracelineh,'Color','k');

xtxt = 0.02374;
ytxt = 30;
text(xtxt+5e-4,ytxt+0.6,'BQ^2','FontSize',12);

arrow([Qmp,Hmp+15],[Qmp,Hmp+3]);
xtxt1 = Qmp - 3e-3;
ytxt1 = Hmp + 15 + 3;
text(xtxt1,ytxt1,'operating point','FontSize',12);

xlim([0 Q1(end)]);
ylim([0 H1(1)]);

legend({'pump','system'},'Location','southwest','FontSize',12);
xlabel('Q','FontSize',12);
ylabel('H','FontSize',12);
xticks([]);
yticks([]);
%%
print('performance_curve_simple','-dpng','-r720');


%%
