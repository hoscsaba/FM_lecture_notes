function Dimensionless_qunatities
close all
clear all
clc
format long 
format compact

qopt=[1, 0.1, 0.01];
nq=10:1:200;

[NQ,QOPT]=meshgrid(nq,qopt);

ETAMAX = 0.94-0.048.*QOPT.^(-0.32)-0.29.*(log(NQ./44)).^2;
pszi=(300./(270+nq)).^(9/4);
sigma_vec=sqrt(pi)./(2.^(0.25).*9.81.^(0.75)).*nq;
delta_vec=(2.1./(1.41.*log(sigma_vec))).^(1.34);

szin={'k-','k--','k-.'};

f1=figure(1);
for ii=1:size(NQ,1)
plot(NQ(ii,:),ETAMAX(ii,:),szin{ii}),axis([0,200,0,1]),grid on,hold on
end
legend(['Q_{opt} = ',num2str(qopt(1)),' [m^3/s]'],...
    ['Q_{opt} = ',num2str(qopt(2)),' [m^3/s]'],...
    ['Q_{opt} = ',num2str(qopt(3)),' [m^3/s]'],...
    'Location','NorthEast')
xlabel('n_q'),ylabel('\eta_{max}'),title('Elérhetõ maximum hatásfok')
set(f1,'PaperPosition',[0 0 8 7],'PaperSize',[8 7])
print('-dpng','-f1','-r500','Eta_nq_fcn.png')
print('-dpdf','-f1','-r500','Eta_nq_fcn.pdf')

f2=figure(2);
semilogx(nq,delta_vec),grid on
xlabel('n_q'),ylabel('\delta')
set(f2,'PaperPosition',[0 0 8 7],'PaperSize',[8 7])
print('-dpng','-f2','-r500','delta_nq_fcn.png')
print('-dpdf','-f2','-r500','delta_nq_fcn.pdf')

end