function [valid_x,valid_y]=extract_minutiae(I)
    % Variables definition
    window =3;
    margin = 15;
    w = 1;
    threshold = 0.1;
    
    % Code recognition
    [cimg, oimg,fimg,bwimg,eimg,enhI] =  fft_enhance_cubs(I, -1);
    [newim, binI, mask, relI, I_enhaced] =  testfin(enhI); 
    binI(relI<threshold)=0; 
    inv_binI = (binI == 0); 
    thin =  bwmorph(inv_binI, 'thin',Inf);
    [minutiae, minutiae_x, minutiae_y,my_time(7)]=extraction(thin,window,margin);
    [valid, valid_x, valid_y, my_time(8)]=validation(thin,minutiae,w);
end