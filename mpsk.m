%searching for the feature of wave transfer by mpsk modification
filename='USRP_04/mpsk_04.dat';
start=0*8;  %every 8 bytes represent one complex data
group=1000;
subgroup=10;
fft_size=4096;   %fft size
peaknum=3;
[p fr]=peak_hold(filename,start,group,subgroup,fft_size);

big=zeros(subgroup,peaknum);
tag=zeros(subgroup,peaknum);
for i=1:1:subgroup
    temp=p(i,:);
    for j=1:1:peaknum
        [big(i,j),tag(i,j)]=max(temp);
        temp(tag(i,j)-10*fft_size/1024:tag(i,j)+10*fft_size/1024)=min(temp);
    end
end

for i=1:1:subgroup
    [b,ref]=sort(tag(i,:));
    for j=1:1:peaknum
        big(i,j)=b(ref(j));
    end
end

figure (2);
for i=1:1:subgroup
    std=max(big(i,:));
    for j=1:1:peaknum
        stdp(i,j)=big(i,j)*1.0/std*10
        plot(stdp(i,:));
        hold on;
    end
end

%plot(stdp);

