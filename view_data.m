%view data streaming from gnuradio after fft processing
%the output fr is the power in dB in frequency domain sequence
%32 bit chars map to one complex
function fr=view_data(filename,start,len)  
    if(nargin<1) 
        filename='test_rx.dat';
    end
    if (nargin<3) %optional parameter
        start=0;
        len=Inf;
    end
    cr=read_complex_binary(filename,start,len);
    ar=real(cr);
    br=real(cr);
    lr=sqrt(ar.^2+br.^2);
    fr=20*log10(lr);
    
%     ct=read_complex_binary(filename,start,len);
%     at=real(cr);
%     bt=real(cr);
%     lt=sqrt(ar.^2+br.^2);
%     ft=20*log10(lr);
end
        


