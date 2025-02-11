clear all;
clc;


p0 = 5;
pf = 209;
t0 = 1963;
tf = 2019;

t = [1963:0.1:2019];
td = log(pf/p0)/(tf-t0)
p = p0*exp(td.*(t-t0));

pb = p0*exp(0.07.*(t-t0));


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

ymin = min(pb);
ymax = max(pb);
ybuffer = 5;

doubling_time = log(2)/td

figure(1);
pos = get(gcf, 'Position');
ax = axes;
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca,'Fontname','CMU bright','Fontsize',fsz);
plot(t,p,'-b',t,pb,'-r');
legend('Actual', 'Prediction',  'Location', 'West');
ylabel('Price ($)');
xlabel('Year');
%title('Maori Population vs Date');
grid on;
xlim([(xmin - xbuffer) (xmax + xbuffer)]);
ylim([(ymin-ybuffer) (ymax+ybuffer)]);
print(gcf,'vail_price.png','-dpng','-r300');