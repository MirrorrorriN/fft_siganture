%trying to find the feature of wave tranformed by mpsk method
filename='USRP_04\mpsk_04.dat';
start=0*8;
group=1000;
subgroup=10;
fft_size=4096;   %fft size
len=group*fft_size;
data=view_data(filename,start,len);
fr=reshape(data,fft_size,group);
fr=fr';     %now the power data have been tranform into group*fft matrix
for i=1:1:subgroup
    for j=1:1:fft_size
        p(i,j)=max(fr(((i-1)*group/subgroup+1):(i-1)*group+group/subgroup),j)
    end
end


