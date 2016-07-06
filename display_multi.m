group=500;
fft_size=1024;
start=0;
samples=2;

multi=view_data('7_5/multi1.dat',start,group*fft_size);
multi1=reshape(multi,fft_size,group);
multi1=multi1';
multi=view_data('7_5/multi4.dat',start,group*fft_size);
multi2=reshape(multi,fft_size,group);
multi2=multi2';

sig1=mean(multi1);
sig2=mean(multi2);
plot(sig1);
hold on;
plot(sig2);
hold on;

%h1=legend('Location','NorthEast','usrp1','usrp4');

start=1024*500*8
multi=view_data('7_5/multi1.dat',start,group*fft_size);
multi1=reshape(multi,fft_size,group);
multi1=multi1';
multi=view_data('7_5/multi4.dat',start,group*fft_size);
multi2=reshape(multi,fft_size,group);
multi2=multi2';

sig1=mean(multi1);
sig2=mean(multi2);
plot(sig1);
hold on;
plot(sig2);
hold on;

h2=legend('Location','NorthEast','usrp1','usrp4','usrp1_1','usrp4_4');