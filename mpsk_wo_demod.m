%searching for the feature of wave transfer by mpsk modification
filename='4_6/USRP_04/mpsk_wo_demod4.dat';
start=0*8;  %every 8 bytes represent one complex data
group=2000;
subgroup=100;
fft_size=4096;   %fft size
peaknum=2;
[p fr]=peak_hold(filename,start,group,subgroup,fft_size);
pri=[1054,3102];

big=zeros(subgroup,peaknum);
tag=zeros(subgroup,peaknum);
for i=1:1:subgroup
    temp=p(i,:);
    for j=1:1:peaknum
        [big(i,j),tag(i,j)]=max(temp(pri(j)-20*fft_size/1024:pri(j)+20*fft_size/1024));
        %temp(tag(i,j)-10*fft_size/1024:tag(i,j)+10*fft_size/1024)=min(temp);
        tag(i,j)=tag(i,j)+pri(j)-20*fft_size/1024-1
    end
end

for i=1:1:subgroup
    [b,ref]=sort(tag(i,:));
    t=big(i,:);
    for j=1:1:peaknum
        big(i,j)=t(ref(j));
    end
end

figure (4);
for i=1:1:subgroup
    std=max(big(i,:));
    for j=1:1:peaknum
        stdp(i,j)=big(i,j)*1.0/std*10
        plot(stdp(i,:));
        hold on;
    end
end



%plot(stdp);