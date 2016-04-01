%searching for the feature of wave transfer by mpsk modification
filename='USRP_04/mpsk_04.dat';
start=0*8;  %every 8 bytes represent one complex data
group=100;
subgroup=10;
fft_size=4096;   %fft size
[p fr]=find_peak(filename,start,group,subgroup,fft_size);
