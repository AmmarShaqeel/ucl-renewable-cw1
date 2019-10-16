clear all;
clc;


p0 = 7.50;
pf = 100;
t0 = 1955;
tf = 2019;

t = [1955:0.1:2019];
td = log2(pf/p0)/(tf-t0);
p = p0*2.^(td.*(t-t0));


%% Printing Image%%
width = 5;     % Width in inches
height = 3;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz = 14;      % Fontsize
lw = 1.5;      % LineWidth
msz = 8;       % MarkerSize

xmin = min(t);
xmax = max(t);
xbuffer = 10;

ymin = min(p);
ymax = max(p);
ybuffer = 5;

figure(1);
pos = get(gcf, 'Position');
ax = axes;
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca,'Fontname','CMU bright','Fontsize',fsz);
plot(t,p,'-b');
ylabel('Price ($)');
xlabel('Year');
%title('Maori Population vs Date');
grid on;
xlim([(xmin - xbuffer) (xmax + xbuffer)]);
ylim([(ymin-ybuffer) (ymax+ybuffer)]);
print(gcf,'disney_price.png','-dpng','-r300');