% 抽样数为N
clear
clc
N=61;
wc=pi/3;
dw = 2*pi/1000;   
N1=fix(wc/(2*pi/N));
N2=N-N1-1;
A=[ones(1,N1+1),zeros(1,N2)];
theta=-pi*[0:N-1]*(N-1)/N;
H=A.*exp(j*theta);
h=real(ifft(H));
[Ar,ww,type,L0]=amplres(h);             % 检验设计出的滤波器的符幅特性
[db,mag,pha,grd,w] = myfreqz(h,[1]);    % 检验设计出的滤波器的频率响应
l = 0:N-1; wl = (2*pi/N)*l; 
wp1=2*pi/N*fix(wc/(2*pi/N)-1);
ws1=wp1+4*2*pi/N;
Rp = -min(db(1:fix(wp1/dw)+1))      % 实际的通带波动
As = -round(max(db(fix(ws1/dw)+1:501)))  % 最小阻带衰减
subplot(2,2,1);
plot(A); % 绘图
axis([-1,N,-0.1,1.1]);
title('频率样本')
xlabel('');
ylabel('A(k)')
subplot(2,2,2); 
stem(h,'.'); 
axis([-1,N,-0.1,0.5])
title('脉冲响应');
ylabel('h(n)');
text(N+1,-0.1,'n')
subplot(2,2,3); 
plot(w/pi,db);
axis([0,1,-80,10]);
title('幅度响应'); xlabel('频率（单位：pi）');
ylabel('分贝数');
subplot(2,2,4);
plot(ww/pi,2*Ar,wl(1:N)/pi,A(1:N),'.');
axis([0,1,-0.2,1.2]); title('符幅响应')
xlabel('频率（单位：pi）'); ylabel('Ar(w)')
hold on



