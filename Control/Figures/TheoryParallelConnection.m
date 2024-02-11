function TheoryParallelConnection
global Ap1 Bp1 Ap2 Bp2 Q

Ap1  = 80;
Ap2  = 60;
Bp1  = 80000;
Bp2  = 70000;
Bp2r = 250000;
As   = 15;
Bs   = 10000;

Qlim1 = sqrt(Ap1/Bp1);
Qlim2 = sqrt(Ap2/Bp2);
Qlim3 = sqrt(-(Ap2-Ap1)/Bp1);
Qlim4 = sqrt(Ap1/Bp1) + sqrt(Ap2/Bp2);

Q1  = linspace(0,Qlim1,1000);
Q2  = linspace(0,Qlim2,1000);
Q2r = linspace(-0.01,0,200);
Q3  = linspace(Qlim3,Qlim4,1000);
Qs  = linspace(0,0.07,1000);

Hp1  = Ap1 -  Bp1*Q1.^2;
Hp2  = Ap2 -  Bp2*Q2.^2;
Hp2r = Ap2 + Bp2r*Q2r.^2;
Hs   = As + Bs*Qs.^2;

x0 = 60;
for i=1:length(Q3)
    Q = Q3(i);
    Hp3(i) = fzero(@parallel,x0);
    x0 = Hp3(i);
end

Hdr   = linspace(0,Ap2,5);
Qp1dr = sqrt( (Ap1-Hdr)/Bp1 );
Qp2dr = sqrt( (Ap2-Hdr)/Bp2 );
Hsdr  = Hdr(  Hdr>=As  );
Qsdr  = sqrt( (Hsdr-As)/Bs );
Qp3dr = Qp1dr + Qp2dr;

figure(10); hold on;
p1=plot(Q1,Hp1);
p2=plot(Q2,Hp2);
p3=plot(Q2r,Hp2r);
p4=plot(Q3,Hp3);
p5=plot(Qs,Hs);

p6=plot(Qp1dr,Hdr);
p7=plot(Qp2dr,Hdr);
p8=plot(Qsdr,Hsdr);
p9=plot(Qp3dr,Hdr);

set(p1,'LineWidth',2,'Color',[0 0 0]);
set(p2,'LineWidth',2,'Color',[0 0 0]);
set(p3,'LineWidth',2,'Color',[0 0 0],'LineStyle','--');
set(p4,'LineWidth',2,'Color',[0 0 1]);
set(p5,'LineWidth',2,'Color',[1 0 0]);

set(p6,'Color',[0 0 0],'LineStyle','none','Marker','.','MarkerSize',25);
set(p7,'Color',[0 0 0],'LineStyle','none','Marker','.','MarkerSize',25);
set(p8,'Color',[1 0 0],'LineStyle','none','Marker','.','MarkerSize',25);
set(p9,'Color',[0 0 1],'LineStyle','none','Marker','.','MarkerSize',25);

p10=plot([0 0], [0 90]);
set(p10,'LineWidth',0.5,'Color',[0 0 0]);
for i=Hdr
    pi=plot([0 0.07], [i i]);
    set(pi,'LineWidth',0.5,'Color',[0 0 0],'LineStyle','--');
end

p14=plot([0 0.04339], [33.8 33.8]);
p15=plot([0.04339 0.04339], [0 33.8]);
p16=plot([0.0240 0.0240], [0 33.8]);
p17=plot([0.0193 0.0193], [0 33.8]);

p11=plot([0.04339], [33.8]);
p12=plot([0.0240], [33.8]);
p13=plot([0.0193], [33.8]);

set(p11,'LineWidth',5,'Color',[0 0 0],'LineStyle','none','Marker','+','MarkerSize',14);
set(p12,'LineWidth',5,'Color',[0 0 0],'LineStyle','none','Marker','+','MarkerSize',10);
set(p13,'LineWidth',5,'Color',[0 0 0],'LineStyle','none','Marker','+','MarkerSize',10);

set(p14,'LineWidth',0.5,'Color',[1 0 0]);
set(p15,'LineWidth',0.5,'Color',[1 0 0]);
set(p16,'LineWidth',0.5,'Color',[1 0 0]);
set(p17,'LineWidth',0.5,'Color',[1 0 0]);


set(gca,'Box','on','XGrid','on','YGrid','on','XLim',[-0.01 0.07],'YLim',[0 90]);
set(gca,'FontName','Times','FontSize',14,'FontWeight','bold');

xlab=xlabel('Q (m^3/s)');
set(xlab,'FontName','Times','FontSize',16,'FontWeight','bold','FontAngle','normal');
ylab=ylabel('H (m)');
set(ylab,'FontName','Times','FontSize',16,'FontWeight','bold','FontAngle','normal');


function y=parallel(x)
global Ap1 Bp1 Ap2 Bp2 Q

y = Q - sqrt( (Ap1-x)/Bp1 ) - sqrt( (Ap2-x)/Bp2 );