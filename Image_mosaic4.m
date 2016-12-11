function mosaic = Image_mosaic4(path1,path2,path3,path4)
I1=imreadbw(path1) ;
I2=imreadbw(path2) ;
I3=imreadbw(path3) ;
I4=imreadbw(path4) ;


I1c=double(imread(path1))/255.0 ;
I2c=double(imread(path2))/255.0 ;
I3c=double(imread(path3))/255.0 ;
I4c=double(imread(path4))/255.0 ;

I1 = Im_preprocess(I1);
I2 = Im_preprocess(I2);
I3 = Im_preprocess(I3);
I4 = Im_preprocess(I3);


S=3 ;

fprintf('Computing frames and descriptors.\n') ;
[frames1,descr1,gss1,dogss1] = sift( I1, 'Verbosity', 1, 'Threshold', ...
    0.005, 'NumLevels', S ) ;
[frames2,descr2,gss2,dogss2] = sift( I2, 'Verbosity', 1, 'Threshold', ...
    0.005, 'NumLevels', S ) ;
[frames3,descr3,gss3,dogss3] = sift( I3, 'Verbosity', 1, 'Threshold', ...
    0.005, 'NumLevels', S ) ;
[frames4,descr4,gss4,dogss4] = sift( I4, 'Verbosity', 1, 'Threshold', ...
    0.005, 'NumLevels', S ) ;

figure(1) ; clf ;
subplot(2,2,1) ; imagesc(I1) ; colormap gray ; axis image ;
hold on ;
plot(frames1(1,:),frames1(2,:),'rx','MarkerSize',5);
title('keypoints of image 1');

subplot(2,2,2) ; imagesc(I2) ; colormap gray ; axis image ;
hold on ;
plot(frames2(1,:),frames2(2,:),'rx','MarkerSize',5);
title('keypoints of image 2');

subplot(2,2,3) ; imagesc(I3) ; colormap gray ; axis image ;
hold on ;
plot(frames3(1,:),frames3(2,:),'rx','MarkerSize',5);
title('keypoints of image 3');

subplot(2,2,4) ; imagesc(I4) ; colormap gray ; axis image ;
hold on ;
plot(frames4(1,:),frames4(2,:),'rx','MarkerSize',5);
title('keypoints of image 4');


fprintf('Computing matches.\n');



matches = Comp_match(frames1,frames2,descr1,descr2);
matches2 = Comp_match(frames1,frames2,descr2,descr3);
matches3 = Comp_match(frames3,frames4,descr3,descr4);


[H ok] = Ransac(frames1,frames2,matches);
[H4 ok4] = Ransac(frames2, frames3, matches2);
[H5 ok5] = Ransac(frames3, frames4,matches3);

numMatches = size(matches,2);
numMatches2 = size(matches2,2);
numMatches3 = size(matches3,2);

if(sum(ok)/numMatches > 15 && sum(ok4)/numMatches2 > 15 && sum(ok5)/numMatches3 > 15)
    figure(2) ; clf ;
    
    dh1 = max(size(I2c,1)-size(I1c,1),0) ;
    dh2 = max(size(I1c,1)-size(I2c,1),0) ;
    
    subplot(3,1,1);
    imagesc([padarray(I1c,dh1,'post') padarray(I2c,dh2,'post')]) ;
    o = size(I1c,2) ;
    hold on;
    line([frames1(1,matches(1,:));frames2(1,matches(2,:))+o], ...
        [frames1(2,matches(1,:));frames2(2,matches(2,:))]) ;
    
    title(sprintf('Matches found between 1 and 2: %d',numMatches));
    drawnow ;
    
    
    dh1 = max(size(I3c,1)-size(I2c,1),0) ;
    dh2 = max(size(I2c,1)-size(I3c,1),0) ;
    
    subplot(3,1,2);
    imagesc([padarray(I2c,dh1,'post') padarray(I3c,dh2,'post')]) ;
    o = size(I2c,2) ;
    hold on;
    line([frames2(1,matches2(1,:));frames3(1,matches2(2,:))+o], ...
        [frames2(2,matches2(1,:));frames3(2,matches2(2,:))]) ;
    
    title(sprintf('Matches found between 2 and 3: %d',numMatches2));
    drawnow ;
    
    dh1 = max(size(I4c,1)-size(I3c,1),0) ;
    dh2 = max(size(I3c,1)-size(I4c,1),0) ;
    
    subplot(3,1,3);
    imagesc([padarray(I3c,dh1,'post') padarray(I4c,dh2,'post')]) ;
    o = size(I3c,2) ;
    hold on;
    line([frames3(1,matches3(1,:));frames4(1,matches3(2,:))+o], ...
        [frames3(2,matches3(1,:));frames4(2,matches3(2,:))]) ;
    
    title(sprintf('Matches found between 3 and 4: %d',numMatches3));
    drawnow ;
    
    
    
    figure(3) ; clf ;
    subplot(3,1,1);
    imagesc([padarray(I1c,dh1,'post') padarray(I2c,dh2,'post')]) ;
    o = size(I1c,2) ;
    hold on;
    line([frames1(1,matches(1,ok));frames2(1,matches(2,ok))+o], ...
        [frames1(2,matches(1,ok));frames2(2,matches(2,ok))]) ;
    title(sprintf('%d (%.2f%%) inliner matches out of %d', ...
        sum(ok), ...
        100*sum(ok)/numMatches, ...
        numMatches)) ;
    drawnow ;
    
    fprintf('Computing matches between 2 and 3.\n') ;
    
    dh1 = max(size(I3c,1)-size(I2c,1),0) ;
    dh2 = max(size(I2c,1)-size(I3c,1),0) ;
    
    matches2 = Comp_match(frames1,frames2,descr2,descr3);
    
    subplot(3,1,2);
    imagesc([padarray(I2c,dh1,'post') padarray(I3c,dh2,'post')]) ;
    o = size(I2c,2) ;
    hold on;
    line([frames2(1,matches2(1,ok4));frames3(1,matches2(2,ok4))+o], ...
        [frames2(2,matches2(1,ok4));frames3(2,matches2(2,ok4))]) ;
    
    title(sprintf('%d (%.2f%%) inliner matches out of %d', ...
        sum(ok4), ...
        100*sum(ok4)/numMatches2, ...
        numMatches2)) ;
    drawnow ;
    
    dh1 = max(size(I4c,1)-size(I3c,1),0) ;
    dh2 = max(size(I3c,1)-size(I4c,1),0) ;
    
    matches3 = Comp_match(frames3,frames4,descr3,descr4);
    subplot(3,1,3);
    imagesc([padarray(I3c,dh1,'post') padarray(I4c,dh2,'post')]) ;
    o = size(I3c,2) ;
    hold on;
    line([frames3(1,matches3(1,:));frames4(1,matches3(2,:))+o], ...
        [frames3(2,matches3(1,:));frames4(2,matches3(2,:))]) ;
    
    title(sprintf('%d (%.2f%%) inliner matches out of %d', ...
        sum(ok5), ...
        100*sum(ok5)/numMatches3, ...
        numMatches3)) ;
    drawnow ;
    
    
    mos(I1c,I2c,H);
    mosresult1 = imread('result.jpg');
    mosresult1= double(mosresult1)/255.0;
    mos1gray = imreadbw('result.jpg');
    mos1gray = Im_preprocess(mos1gray);
    
    [frames5,descr5,gss5,dogss5] = sift( mos1gray, 'Verbosity', 1, 'Threshold', ...
        0.005, 'NumLevels', S ) ;
    
    [H2 ok2] = Ransac(frames3,frames4,matches3);
    
    mos(I3c,I4c,H2);
    mosresult2 = imread('result.jpg');
    mosresult2= double(mosresult2)/255.0;
    mos2gray = imreadbw('result.jpg');
    mos2gray = Im_preprocess(mos2gray);
    
    [frames6,descr6,gss6,dogss6] = sift( mos2gray, 'Verbosity', 1, 'Threshold', ...
        0.005, 'NumLevels', S ) ;
    
    
    matches4 = Comp_match(frames5,frames6,descr5,descr6);
    [H3 ok3] = Ransac(frames5,frames6,matches4);
    
    mosfinal = mos(mosresult1,mosresult2,H3);
    filename = 'result.jpg';
    imwrite(mosfinal,filename)
    figure(4) ; clf ;
    imagesc(mosfinal) ; axis image off ;
    title('Mosaic') ;
    
    if nargout == 0, clear mosaic ; end
else
    errordlg('The images selected are not matching. Kindly select matching images');
end
%------------end of main function--------------
end






function preprocessedImage = Im_preprocess(I1)
I1=imsmooth(I1,.1) ;


I1=I1-min(I1(:)) ;
I1=I1/max(I1(:)) ;
preprocessedImage  = I1;
end



function matches = Comp_match(frames1,frames2,descr1,descr2)
%fprintf('Computing matches between 1 and 2.\n') ;
% By passing to integers we greatly enhance the matching speed (we use
% the scale factor 512 as Lowe's, but it could be greater without
% overflow)
descr1=uint8(512*descr1) ;
descr2=uint8(512*descr2) ;
tic ;
matches=siftmatch( descr1, descr2 ) ;
fprintf('Matched in %.3f s\n', toc) ;

end




function [H ok] = Ransac(frames1,frames2,matches)
numMatches = size(matches,2) ;

X1 = frames1(1:2,matches(1,:)) ; X1(3,:) = 1 ;
X2 = frames2(1:2,matches(2,:)) ; X2(3,:) = 1 ;

clear H score ok ;
for t = 1:100
    % estimate homograpy
    subset = vl_colsubset(1:numMatches, 4) ;
    A = [] ;
    for i = subset
        A = cat(1, A, kron(X1(:,i)', vl_hat(X2(:,i)))) ;
    end
    [U,S,V] = svd(A) ;
    H{t} = reshape(V(:,9),3,3) ;
    
    % score homography
    X2_ = H{t} * X1 ;
    du = X2_(1,:)./X2_(3,:) - X2(1,:)./X2(3,:) ;
    dv = X2_(2,:)./X2_(3,:) - X2(2,:)./X2(3,:) ;
    ok{t} = (du.*du + dv.*dv) < 6*6 ;
    score(t) = sum(ok{t}) ;
end

[score, best] = max(score) ;
H = H{best} ;
ok = ok{best} ;
end

function mos = mos(I1c,I2c,H)
box2 = [1  size(I2c,2) size(I2c,2)  1 ;
    1  1           size(I2c,1)  size(I2c,1) ;
    1  1           1            1 ] ;
box2_ = inv(H) * box2 ;
box2_(1,:) = box2_(1,:) ./ box2_(3,:) ;
box2_(2,:) = box2_(2,:) ./ box2_(3,:) ;
ur = min([1 box2_(1,:)]):max([size(I1c,2) box2_(1,:)]) ;
vr = min([1 box2_(2,:)]):max([size(I1c,1) box2_(2,:)]) ;

[u,v] = meshgrid(ur,vr) ;
I1_ = vl_imwbackward(im2double(I1c),u,v) ;

z_ = H(3,1) * u + H(3,2) * v + H(3,3) ;
u_ = (H(1,1) * u + H(1,2) * v + H(1,3)) ./ z_ ;
v_ = (H(2,1) * u + H(2,2) * v + H(2,3)) ./ z_ ;
I2_ = vl_imwbackward(im2double(I2c),u_,v_) ;

mass = ~isnan(I1_) + ~isnan(I2_) ;
I1_(isnan(I1_)) = 0 ;
I2_(isnan(I2_)) = 0 ;
mos = (I1_ + I2_) ./ mass ;
filename = 'result.jpg';
imwrite(mos,filename)
end