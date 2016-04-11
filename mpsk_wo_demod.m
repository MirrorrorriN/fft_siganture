%searching for the feature of wave transfer by mpsk modification
filename='USRP_04/mpsk_wo_demod4_4_11.dat';
start=0*8;  %every 8 bytes represent one complex data
group=2000;
subgroup=100;
fft_size=4096;   %fft size
peaknum=6;
[p fr]=peak_hold(filename,start,group,subgroup,fft_size);
%pri=[511,1054,2048,3102,3478];
pri=[278,511,1054,3084,3475,3875]   %USRP01
%pri=   %USRP04
big=zeros(subgroup,peaknum);
tag=zeros(subgroup,peaknum);
for i=1:1:subgroup
    temp=p(i,:);
    for j=1:1:peaknum
        [big(i,j),tag(i,j)]=max(temp(pri(j)-10*fft_size/1024:pri(j)+10*fft_size/1024));
        %temp(tag(i,j)-10*fft_size/1024:tag(i,j)+10*fft_size/1024)=min(temp);
        tag(i,j)=tag(i,j)+pri(j)-10*fft_size/1024-1
    end
end

for i=1:1:subgroup
    [b,ref]=sort(tag(i,:));
    t=big(i,:);
    for j=1:1:peaknum
        big(i,j)=t(ref(j));
    end
end

for i=1:1:subgroup
    %std=max(big(i,:));
    std=big(i,1);
    for j=1:1:peaknum
        stdp(i,j)=big(i,j)*1.0/std*10
        plot(stdp(i,:));
        hold on;
    end
end
