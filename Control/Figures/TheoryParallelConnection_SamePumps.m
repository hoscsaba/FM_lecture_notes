function TheoryParallelConnection_SamePumps

Ap = 60;
Bp = 70000;
As = 15;
Bs = 10000;

Qlim = sqrt(Ap/Bp);
Q1   = linspace(0,Qlim,1000);
Q2   = linspace(0,2*Qlim,1000);
Q3   = linspace(0,3*Qlim,1000);
Qs   = linspace(0,0.08,1000);

Hp1 = Ap - Bp*Q1.^2;
Hp2 = Ap - (Bp/2^2)*Q2.^2;
Hp3 = Ap - (Bp/3^2)*Q3.^2;

Hp2s = 2*Ap - 2*Bp*Q1.^2;

Hs  = As + Bs*Qs.^2;

figure(11); hold on;
p1=plot(Q1,Hp1);
p2=plot(Q2,Hp2);
p3=plot(Q3,Hp3);
p4=plot(Qs,Hs);

p5=plot(Q1,Hp2s);
set(p5,'LineWidth',2,'Color',[0 0 0],'LineStyle','--');

p12=plot([0.05031],[40.31]);
p13=plot([0.04044],[31.38]);
p14=plot([0.02371],[20.65]);

pi=plot([0 0.1], [60 60]);
set(pi,'LineWidth',0.5,'Color',[0 0 0],'LineStyle','--');

set(p1,'LineWidth',2,'Color',[0 0 0]);
set(p2,'LineWidth',2,'Color',[0 0 0]);
set(p3,'LineWidth',2,'Color',[0 0 0]);
set(p4,'LineWidth',2,'Color',[1 0 0]);
set(p12,'LineWidth',5,'Color',[0 0 0],'LineStyle','none','Marker','+','MarkerSize',14);
set(p13,'LineWidth',5,'Color',[0 0 0],'LineStyle','none','Marker','+','MarkerSize',14);
set(p14,'LineWidth',5,'Color',[0 0 0],'LineStyle','none','Marker','+','MarkerSize',14);

set(gca,'Box','on','XGrid','on','YGrid','on','YLim',[0 70]);
set(gca,'FontName','Times','FontSize',14,'FontWeight','bold');

xlab=xlabel('Q (m^3/s)');
set(xlab,'FontName','Times','FontSize',16,'FontWeight','bold','FontAngle','normal');
ylab=ylabel('H (m)');
set(ylab,'FontName','Times','FontSize',16,'FontWeight','bold','FontAngle','normal');