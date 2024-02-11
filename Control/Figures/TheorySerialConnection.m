function TheorySerialConnection

Ap1 = 80;
Ap2 = 40;
Bp1 = 80000;
Bp2 = 60000;
As  = 60;
Bs  = 400000;

Qlim1 = sqrt(Ap1/Bp1);
Qlim2 = sqrt(Ap2/Bp2);
Qlim3 = sqrt((Ap2+Ap1)/(Bp2+Bp1));

Q1  = linspace(0,Qlim1,1000);
Q2  = linspace(0,Qlim2,1000);
Q2r = linspace(Qlim1,Qlim2,200);
Qdr = linspace(0,Qlim2,7);

Hp1  = Ap1 - Bp1*Q1.^2;
Hp2  = Ap2 - Bp2*Q2.^2;
Hp2r = Ap2 - Bp2*Q2r.^2;
Hp3  = Ap1+Ap2 - (Bp1+Bp2)*Q2.^2;
Hp3r = Ap1+Ap2 - (Bp1+Bp2)*Q2r.^2;

Hp1dr = Ap1 - Bp1*Qdr.^2;
Hp2dr = Ap2 - Bp2*Qdr.^2;
Hp3dr = Ap1+Ap2 - (Bp1+Bp2)*Qdr.^2;

Hs   = As + Bs*Q2.^2;
Hsdr = As + Bs*Qdr.^2;

figure(10); hold on;
p1=plot(Q1,Hp1);
p2=plot(Q2,Hp2);
p3=plot(Q2r,Hp2r);
p4=plot(Q2,Hp3);
p5=plot(Qdr,Hp1dr);
p6=plot(Qdr,Hp2dr);
p7=plot(Qdr,Hp3dr);

p8=plot([0 0.035], [0 0]);
for i=Qdr
    pi=plot([i i], [0 120]);
    set(pi,'LineWidth',0.5,'Color',[0 0 0],'LineStyle','--');
end

p9=plot(Q2,Hs);
p10=plot(Qdr,Hsdr);
p11=plot(Q2r,Hp3r);

p13=plot([0.01055 0.01055], [104.4 0]);
p14=plot([0 0.01055], [104.4 104.4]);
p15=plot([0 0.01055], [71.11 71.11]);
p16=plot([0 0.01055], [33.33 33.33]);

p17=plot([0.01055], [104.4]);
p18=plot([0.01055], [71.11]);
p19=plot([0.01055], [33.33]);

set(p1,'LineWidth',2,'Color',[0 0 0]);
set(p2,'LineWidth',2,'Color',[0 0 0]);
set(p3,'LineWidth',2,'Color',[0 0 0],'LineStyle','--');
set(p4,'LineWidth',2,'Color',[0 0 1]);
set(p5,'Color',[0 0 0],'LineStyle','none','Marker','.','MarkerSize',25);
set(p6,'Color',[0 0 0],'LineStyle','none','Marker','.','MarkerSize',25);
set(p7,'Color',[0 0 1],'LineStyle','none','Marker','.','MarkerSize',25);
set(p8,'LineWidth',0.5,'Color',[0 0 0]);
set(p9,'LineWidth',2,'Color',[1 0 0]);
set(p10,'Color',[1 0 0],'LineStyle','none','Marker','.','MarkerSize',25);
set(p11,'LineWidth',2,'Color',[0 0 1],'LineStyle','--');
set(p13,'LineWidth',0.5,'Color',[1 0 0]);
set(p14,'LineWidth',0.5,'Color',[1 0 0]);
set(p15,'LineWidth',0.5,'Color',[1 0 0]);
set(p16,'LineWidth',0.5,'Color',[1 0 0]);
set(p17,'LineWidth',5,'Color',[0 0 0],'LineStyle','none','Marker','+','MarkerSize',14);
set(p18,'LineWidth',5,'Color',[0 0 0],'LineStyle','none','Marker','+','MarkerSize',10);
set(p19,'LineWidth',5,'Color',[0 0 0],'LineStyle','none','Marker','+','MarkerSize',10);

set(gca,'Box','on','XGrid','on','YGrid','on','YLim',[-20 140]);
set(gca,'FontName','Times','FontSize',14,'FontWeight','bold');

xlab=xlabel('Q (m^3/s)');
set(xlab,'FontName','Times','FontSize',16,'FontWeight','bold','FontAngle','normal');
ylab=ylabel('H (m)');
set(ylab,'FontName','Times','FontSize',16,'FontWeight','bold','FontAngle','normal');