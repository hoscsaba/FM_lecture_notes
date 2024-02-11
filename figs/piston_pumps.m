function piston_pumps

clc, clear all

t=linspace(0,1,1000);
for i=1:11
    Q=flowrate(t,i);
    delta(i)=(max(Q)-min(Q))/mean(Q)*100;
    dQ=Q-mean(Q);
    
    if i<5
    dV{i}(1)=0;
    for j=2:length(t)
        dV{i}(j)=trapz(t(1:j),dQ(1:j));
    end
    end
end

figure(1), clf
subplot(6,2,[9 10 11 12])
semilogy(delta,'*'), hold off, grid on
xlabel('Number of pistons')
ylabel('\delta=(Q_{max}-Q_{min})/Q_{mean}*100')

figure(2), clf
for i=1:4
    subplot(2,2,i)
    if i==1
        plot([0.0515576 0.448442],[-0.00813313 0.167288]*pi*100,'r*'), hold on
    end
    if i==2
        plot([0.109834 0.3902 ],[-0.0335 0.0335]*pi*100,'r*'), hold on
    end
    plot(t,dV{i}*pi*100), grid on
    title(['N=',num2str(i),', dV=',num2str(round(pi*1000*(max(dV{i})-min(dV{i})))/10),'%'])
    set(gca,'xtick',[0 0.5 1],'xticklabel',{'0','T/2','T'})
    ylabel('% of piston stroke');
    ylim([-20,60]);
end

end

function sumQ=flowrate(t,num_of_pistons)

szinek={'k','b','r','g','m','c','k--','b--','r--','g--','m--','c--'};

phase=1/num_of_pistons;
for i=1:num_of_pistons
    Q(i,:)=max(0,sin(2*pi*(t-(i-1)*phase)));
    if num_of_pistons<9
        subplot(6,2,num_of_pistons)
        plot(t,Q(i,:),szinek{i}), hold on
    end
end

for i=1:length(t)
    sumQ(i)=sum(Q(:,i));
end

if num_of_pistons<9
subplot(6,2,num_of_pistons)
plot(t,sumQ,'k'), axis([0 2 0 max(sumQ)*1.1]), hold off
title(['N=',num2str(num_of_pistons)])
set(gca,'xtick',[0 1 2],'xticklabel',{'0','T','2T'})
end

end