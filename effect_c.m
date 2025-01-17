clear all;
clc;

c = [0:1e-7:2e-2];
t0 = 1280;

t = log(1-(0.0287*-log(58000)./(500*c)))/0.0287 + t0;



%% Printing Image%%
width = 5;     % Width in inches
height = 3;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz = 14;      % Fontsize
lw = 1.5;      % LineWidth
msz = 8;       % MarkerSize

figure(1);
pos = get(gcf, 'Position');
ax = axes;
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca,'Fontname','CMU bright','Fontsize',fsz);
plot(c,t);
ylabel('Extinction Date (CE)');
xlabel('Chance of successful Kill');
%title('Maori Population vs Date');
grid on;
xlim([(0-0.001) (2e-2+0.001)]);
ylim([(1281-20) (1584+20)]);
print(gcf,'effect_c.png','-dpng','-r300');