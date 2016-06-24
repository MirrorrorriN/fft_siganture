samples=5;
label=1;
start=1024000;
group=10000;
subgroup=10;
fft_size=1024;
for i=1:1:samples
    %TestName='5_17/ofdm_sig_01_1.dat';
    TestName=['5_17/ofdm_sig_0',int2str(label),'_',int2str(i),'.dat'];
    ofdm=peak_hold(TestName,start,group,subgroup,fft_size);
    signature(i,:)=mean(ofdm);
end
label=2;
for i=1:1:samples
    TestName='5_17/ofdm_sig_01_1.dat';
    TestName=['5_17/ofdm_sig_0',int2str(label),'_',int2str(i),'.dat'];
    ofdm=peak_hold(TestName,start,group,subgroup,fft_size);
    signature(i+5,:)=mean(ofdm);
end
label=3;
for i=1:1:samples
    TestName='5_17/ofdm_sig_01_1.dat';
    TestName=['5_17/ofdm_sig_0',int2str(label),'_',int2str(i),'.dat'];
    ofdm=peak_hold(TestName,start,group,subgroup,fft_size);
    signature(i+10,:)=mean(ofdm);
end
label=4;
for i=1:1:samples
    %TestName='5_17/ofdm_sig_01_1.dat';
    TestName=['5_17/ofdm_sig_0',int2str(label),'_',int2str(i),'.dat'];
    ofdm=peak_hold(TestName,start,group,subgroup,fft_size);
    signature(i+5,:)=mean(ofdm);
end
for i=1:1:10
    for j=1:1:10
%         a=[signature(i,1:301) signature(i,724:1024)];
%         b=[signature(j,1:301) signature(j,724:1024)];
        a=signature(i,302:723);       
        b=signature(j,302:723);        
        similarity(i,j)=dot(a,b)/(norm(a)*norm(b));
        C=corrcoef(a,b);
        corr(i,j)=C(1,2);
    end
end
x=linspace(1,25,25);
color=['r','g','b','c']
for i=1:1:4
    bar(x(6*(i-1)+1:6*i-1),similarity(1,(5*(i-1)+1:5*i)),1,color(i));
    hold on;
end