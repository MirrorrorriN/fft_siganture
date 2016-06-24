start=0;
fft=4096;
len=204800;
sum=0;
channel=10;
basis=2184;

group=len/fft;
cr=read_complex_binary('USRP_01/test_rx_4096.dat',start,len);
ar=real(cr);
br=imag(cr);
lr=sqrt(ar.^2+br.^2);
fr=20*log10(lr);
sum=0;
for i=1:1:group
    tmp=fft*(i-1)+basis;
    head(i)=find(fr((tmp-2):(tmp+2))==max(fr((tmp-2):(tmp+2))));
    tail(i)=find(fr((tmp+5*fft/16-2):(tmp+5*fft/16+2))==max(fr((tmp+5*fft/16-2):(tmp+5*fft/16+2))));
    sum=sum+(tail(i)-head(i))/10;
end
offset=mean(sum);
        
    