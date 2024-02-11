function TheorySerialConnection_SamePumps

Ap = 40;
Bp = 60000;
As = 60;
Bs = 400000;

Qlim = sqrt(Ap/Bp);
Q    = linspace(0,Qlim,1000);

Hp1 = 1*Ap - 1*Bp*Q.^2;
Hp2 = 2*Ap - 2*Bp*Q.^2;
Hp3 = 3*Ap - 3*Bp*Q.^2;

Hs  = As + Bs*Q.^2;

figure(11); hold on;
p1=plot(Q,Hp1);
p2=plot(Q,Hp2);
p3=plot(Q,Hp3);
p4=plot(Q,Hs);

p12=plot([0.01018],[101.5]);
p13=plot([0.006203],[75.4]);

set(p1,'LineWidth',2,'Color',[0 0 0]);
set(p2,'LineWidth',2,'Color',[0 0 0]);
set(p3,'LineWidth',2,'Color',[0 0 1]);
set(p4,'LineWidth',2,'Color',[1 0 0]);
set(p12,'LineWidth',5,'Color',[0 0 0],'LineStyle','none','Marker','+','MarkerSize',14);
set(p13,'LineWidth',5,'Color',[0 0 0],'LineStyle','none','Marker','+','MarkerSize',10);

set(gca,'Box','on','XGrid','on','YGrid','on','YLim',[0 140]);
set(gca,'FontName','Times','FontSize',14,'FontWeight','bold');

xlab=xlabel('Q (m^3/s)');
set(xlab,'FontName','Times','FontSize',16,'FontWeight','bold','FontAngle','normal');
ylab=ylabel('H (m)');
set(ylab,'FontName','Times','FontSize',16,'FontWeight','bold','FontAngle','normal');