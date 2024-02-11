close all
clc
clear all
q=0:1:450;
H=-0.00006667.*q.^2 - 0.00693694*q + 23.79729730;
H=-0.00007.*q.^2 - 0.008*q + 24;
eta=0.9*(-0.000014.*q.^2 + 0.007*q);
a1=subplot(3,1,[1,2]);
plot(q,H,'k-','LineWidth',1),grid on
set(a1,'XTick',0:50:500)
ylabel('H [m]','FontName','Times New Roman','FontSize',11)
axis([0,500,0,25])
a2=subplot(3,1,3);
plot(q,eta,'k-','LineWidth',1),grid on
set(a2,'XTick',0:50:500)
xlabel('Q [m^3/h]','FontName','Times New Roman','FontSize',11)
ylabel('\eta','FontName','Times New Roman','FontSize',11)
axis([0,500,0,1])

set(a1,'FontName','Times New Roman','FontSize',11)
set(a2,'FontName','Times New Roman','FontSize',11)
set(gcf,'PaperPosition',[0 0 10 10],'PaperSize',[10 10])

outfname=['PS_PerfCurves.png'];
print('-dpng','-f1','-r300',outfname)
