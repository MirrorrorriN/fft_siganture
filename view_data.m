%view data streaming from gnuradio after fft processing
%the output fr is the power in dB in frequency domain sequence
%32 bit chars map to one float,64 bit chars map to one complex
function dr=view_data(filename,start,len)  
    if(nargin<1) 
        filename='mpsk_04.dat';
    end
    if (nargin<3) %optional parameter
        start=0;
        len=Inf;
    end
    cr=read_complex_binary(filename,start,len);
    %ar=real(cr);
    %br=imag(cr);
    lr=abs(cr);
    dr=20*log10(lr);
    
%     ct=read_complex_binary(filename,start,len);
%     at=real(cr);
%     bt=real(cr);
%     lt=sqrt(ar.^2+br.^2);
%     ft=20*log10(lr);
end
