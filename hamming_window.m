start=0;
datalen=1024;
group=10;
td=read_complex_binary('tdo110.dat',start,datalen*group);
fft_size=1024; 
for i=1:1:group
    %td(i*1024+1:i*1024+1024)=td(i*1024+1:i*1024+1024).*hamming(fft_size);
    fd=abs(fft(td(i*1024+1:i*1024+1024),fft_size));
    figure(i);
    plot(fd)
end
