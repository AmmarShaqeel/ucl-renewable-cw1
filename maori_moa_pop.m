clear all;
clc;

p0 = 500;
pf = 100000;
r = 0.0287;
t0 = 1280;
t = [1280:1:1700];
c = 2.03e-6;

p = p0.*exp((r.*(t-t0)))./(p0/pf.*exp((r.*(t-t0)))+1);
b = exp((-c*p0)/r*exp(r*(t-t0)) + c*p0/r + log(58000));



%% Printing Image%%
width = 5;     % Width in inches
height = 3;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz = 14;      % Fontsize
lw = 1.5;      % LineWidth
msz = 8;       % MarkerSize

figure(1);
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca,'Fontname','CMU bright','Fontsize',fsz);
plot(t,p,'b-',t,b,'r--');
xlabel('Date (CE)');
ylabel('Population');
%title('Maori Population vs Date');
legend('Maori Population', 'Moa Population',  'Location', 'East');
grid on;
xlim([1230 1850]);
ylim([-10000 110000]);
print(gcf,'maori_moa_pop.png','-dpng','-r300');