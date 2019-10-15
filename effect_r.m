clear all;
clc;

r = [0:0.001:0.05];
t0 = 1280;

t = log(2300)./r + t0;



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
plot(r,t);
ylabel('P reaches 92,000 (CE)');
xlabel('Growth rate');
%title('Maori Population vs Date');
grid on;
xlim([0 0.051]);
ylim([(1.0348e+03) 9420]);
print(gcf,'effect_r.png','-dpng','-r300');