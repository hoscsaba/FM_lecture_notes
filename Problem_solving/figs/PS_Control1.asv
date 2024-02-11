function PS_Control1
% close all
clf
clc
Ap=45; Bp=2781;
Asys=20; Bsys=1125;
Qdes=0.05;

Qmax=sqrt(Ap/Bp);
Hmax=max(Ap,Asys);
Q=linspace(0,Qmax);
Hp=Ap-Bp*Q.^2;
Hsys=Asys+Bsys*Q.^2;

%% Controlling the revolutin speed
[Q1,H1]=Op_point(Ap,Bp,Asys,Bsys);
Hdes=Asys+Bsys*Qdes^2;
Aap=0;
Bap=Hdes/Qdes^2;
Hap=Aap+Bap*Q.^2;
[Q2,H2]=Op_point(Ap,Bp,Aap,Bap);
% Representing the curves and operating points
subplot(3,1,1)
plot(Q,Hp,'b','LineWidth',2),hold on
axis([0 0.15 0 60])
xlabel('Q [m^3/s]')
ylabel('H [m] ~ \Deltap')
title('Controlling the revolution speed')
grid on
pause
plot(Q,Hsys,'r','LineWidth',2)
pause
plot(Q1,H1,'o','LineWidth',2,'MarkerSize',10)
pause
plot([Qdes,Qdes],[0 Hmax],'m','LineWidth',2)
pause
plot([0 Qdes],[0 Hdes],'s','LineWidth',2,'MarkerSize',10)
pause
plot(Q,Hap,'g','LineWidth',2)
pause
plot(Q2,H2,'o','LineWidth',2,'MarkerSize',10)
pause

%% Controlling with series throttle valve
[Q1,H1]=Op_point(Ap,Bp,Asys,Bsys);
Hdes=Ap-Bp*Qdes^2;
Athv=Asys;
Bthv=(Hdes-Asys)/Qdes^2;
Hthv=Athv+Bthv*Q.^2;
Qpipe=Qdes;
Hpipe=Asys+Bsys*Qpipe^2;
% Representing the curves and operating points
subplot(3,1,2)
plot(Q,Hp,'b','LineWidth',2),hold on
axis([0 0.15 0 60])
xlabel('Q [m^3/s]')
ylabel('H [m] ~ \Deltap')
title('Controlling with series throttle valve')
grid on
pause
plot(Q,Hsys,'r','LineWidth',2)
pause
plot(Q1,H1,'o','LineWidth',2,'MarkerSize',10)
pause
plot([Qdes,Qdes],[0 Hmax],'m','LineWidth',2)
pause
plot(Qdes,Hdes,'o','LineWidth',2,'MarkerSize',10)
pause
plot(Q,Hthv,'g','LineWidth',2,'MarkerSize',10)
pause
plot(Qpipe,Hpipe,'s','LineWidth',2,'MarkerSize',10)
pause

%% Controlling with by-pass
[Q1,H1]=Op_point(Ap,Bp,Asys,Bsys);
Hdes=Asys+Bsys*Qdes^2;
Qpump=interp1(Hp,Q,Hdes);
Hpump=Hdes;
% Representing the curves and operating points
subplot(3,1,3)
plot(Q,Hp,'b','LineWidth',2),hold on
axis([0 0.15 0 60])
xlabel('Q [m^3/s]')
ylabel('H [m] ~ \Deltap')
title('Controlling with by-pass')
grid on
pause
plot(Q,Hsys,'r','LineWidth',2)
pause
plot(Q1,H1,'o','LineWidth',2,'MarkerSize',10)
pause
plot([Qdes,Qdes],[0 Hmax],'m','LineWidth',2)
pause
plot(Qdes,Hdes,'o','LineWidth',2,'MarkerSize',10)
pause
plot([0 Qmax],[Hpump,Hpump],'m','LineWidth',2)
pause
plot(Qpump,Hpump,'s','LineWidth',2,'MarkerSize',10)
pause

%% Example sheet
figure
tit={'Controlling the revolution speed',...
    'Controlling with series throttle valve',...
    'Controlling with by-pass'};
for j=1:3
    subplot(3,1,j)
    axis([0 0.15 0 60])
    if j==3
        xlabel('Q [m^3/s]','FontName','Times New Roman','FontSize',11)
    end
    ylabel('H [m]','FontName','Times New Roman','FontSize',11)
    title(tit{j},'FontName','Times New Roman','FontSize',11)
    grid on
    set(gca,'YTick',0:5:60,...
        'XTick',0:0.01:0.15);
end
function [Qop,Hop]=Op_point(Ap,Bp,Asys,Bsys)
Qop=sqrt((Ap-Asys)/(Bp+Bsys));
Hop=Ap-Bp*Qop^2;

