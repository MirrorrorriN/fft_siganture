date='6_24';
samples=3;
start=8*10240;
group=10000;
subgroup=10;
fft_size=1024;
label=1;
window_size=4;
for i=1:1:samples
    %TestName='5_17/ofdm_sig_01_1.dat';
    TestName=[date,'/grc_ofdm',int2str(label),'_',int2str(i),'_0.dat'];
    ofdm=peak_hold(TestName,start,group,subgroup,fft_size);
    signature(i,:)=mean(ofdm);
end
for i=1:1:samples
    %TestName='5_26/ofdm_sig_01_1.dat';
    TestName=[date,'/grc_ofdm',int2str(label),'_',int2str(i),'_1.dat'];
    %TestName=['grc_ofdm',int2str(label),'_1_1.dat'];
    ofdm=peak_hold(TestName,start,group,subgroup,fft_size);
    signature(i+samples,:)=mean(ofdm);
end
label=4;
for i=1:1:samples
    %TestName='5_26/ofdm_sig_01_1.dat';
    TestName=[date,'/grc_ofdm',int2str(label),'_',int2str(i),'_0.dat'];
    ofdm=peak_hold(TestName,start,group,subgroup,fft_size);
    signature(i+samples*2,:)=mean(ofdm);
end
label=4;
for i=1:1:samples
    %TestName='5_17/ofdm_sig_01_1.dat';
    TestName=[date,'/grc_ofdm',int2str(label),'_',int2str(i),'_1.dat'];
    ofdm=peak_hold(TestName,start,group,subgroup,fft_size);
    signature(i+samples*3,:)=mean(ofdm);
end
for i=1:1:samples*4
    for j=1:1:samples*4
%         a=[signature(i,1:301) signature(i,724:1024)];
%         b=[signature(j,1:301) signature(j,724:1024)];
        a=filter(ones(1,window_size)/window_size,1,signature(i,:));       
        b=filter(ones(1,window_size)/window_size,1,signature(j,:));     
        similarity(i,j)=dot(a,b)/(norm(a)*norm(b));
        C=corrcoef(a,b);
        corr(i,j)=C(1,2);
    end
end

figure(3);
x=linspace(1,(samples+1)*4,(samples+1)*4);
color=['r','g','b','c'];
for i=1:1:4
    bar(x((samples+1)*(i-1)+1:(samples+1)*i-1),similarity(6,(samples*(i-1)+1:samples*i)),1,color(i));
    hold on;
end
h1=legend('Location','SouthEast','usrp1 with 0s','usrp1 with 1s','usrp4 with 0s','usrp4 with 1s');
x=linspace(1,(samples+1)*4,(samples+1)*4);
figure(4);
color=['r','g','b','c'];
for i=1:1:4
    bar(x((samples+1)*(i-1)+1:(samples+1)*i-1),corr(6,(samples*(i-1)+1:samples*i)),1,color(i));
    hold on;
end
h2=legend('Location','SouthEast','usrp1 with 0s','usrp1 with 1s','usrp4 with 0s','usrp4 with 1s');