%//////////////// MERT KARAGOZ - N20134084 //////////////////%
clc
close all
%%
%Soru1
%/////////////// LENNA IMAGE ////////////////////////////%
image1 = imread('s1lenna.bmp'); %read image from file
figure;subplot(2,3,1);imshow(image1);title('Original Image'); %print image to subplot
subplot(2,3,4);imhist(image1);title('Original Image Histogram');%print image histogram to subplot

image1_stretched = imadjust(image1,stretchlim(image1),[]);%use contrast stretch on image
subplot(2,3,2);imshow(image1_stretched);title('Contrast Stretched Image');%plot contrast stretch of image
subplot(2,3,5);imhist(image1_stretched);title('Contrast Stretched Image Histogram');%plot contrast stretch histogram of image

image1HISTEQ = histeq(image1);%apply histogram eq. on image
subplot(2,3,3);imshow(image1HISTEQ);title('Histogram Equalized Image');%plot histogram Equalized image
subplot(2,3,6);imhist(image1HISTEQ);title('Histogram Equalized Image Histogram');%plot histogram of histogram Equalized image

%/////////////// PEPPER IMAGE ////////////////////////////%
image2 = imread('s1pepper.bmp');
figure;subplot(2,3,1);imshow(image2);title('Original Image');
subplot(2,3,4);imhist(image2);title('Original Image Histogram');

image2_stretched = imadjust(image2,stretchlim(image2),[]);
subplot(2,3,2);imshow(image2_stretched);title('Contrast Stretched Image');
subplot(2,3,5);imhist(image2_stretched);title('Contrast Stretched Image Histogram');

image2HISTEQ = histeq(image2);
subplot(2,3,3);imshow(image2HISTEQ);title('Histogram Equalized Image');
subplot(2,3,6);imhist(image2HISTEQ);title('Histogram Equalized Image Histogram');

%/////////////// CHEST IMAGE ////////////////////////////%
image3 = imread('s1chest.tif');
%since chest xray photo is in 396x396x4 image i have to remove the 4th
%plane and convert it to gray image to extract its histogram. Otherwise
%histogram function does not work.
image3 = image3(:,:,1:3);
image3 = rgb2gray(image3);

figure;subplot(2,3,1);imshow(image3);title('Original Image');
subplot(2,3,4);imhist(image3);title('Original Image Histogram');

image3_stretched = imadjust(image3,stretchlim(image3),[]);
subplot(2,3,2);imshow(image3_stretched);title('Contrast Stretched Image');
subplot(2,3,5);imhist(image3_stretched);title('Contrast Stretched Image Histogram');

image3HISTEQ = histeq(image3);
subplot(2,3,3);imshow(image3HISTEQ);title('Histogram Equalized Image');
subplot(2,3,6);imhist(image3HISTEQ);title('Histogram Equalized Image Histogram');


%%
%Soru2
%The fingerprint image contains salt&pepper noise. To eliminate the
%salt&pepper noise i will use the median filter with different sizes.
fingerPrint = imread('s2fingerprint.tif');
figure;subplot(2,2,1);imshow(fingerPrint);title('Original Image');

medianFilter1 =  medfilt2(fingerPrint,[3 3]);%apply 3x3 median filter to image
subplot(2,2,2);imshow(medianFilter1);title('Image with median filter 3x3');%plot 3x3 median filtered image

medianFilter2 =  medfilt2(fingerPrint,[4 4]);%apply 4x4 median filter to image
subplot(2,2,3);imshow(medianFilter2);title('Image with median filter 4x4');%plot 4x4 median filtered image

medianFilter3 =  medfilt2(fingerPrint,[5 5]);%apply 5x5 median filter to image
subplot(2,2,4);imshow(medianFilter3);title('Image with median filter 5x5');%plot 5x5 median filtered image

%%
%Soru3 gauss filtre kullan sonra thresholding yap
letterEnhance = imread('s3ocr.tif');
figure;subplot(2,2,1);imshow(letterEnhance);title('Original Image');

%convert binary image to uint8 because gaussian filter cannot be applied to
%binary image files.
letterEnhance8bit = im2uint8(letterEnhance);
letterEnhanceGauss = imgaussfilt(letterEnhance8bit,1.4);%%apply gauss filter to image with 1.4 sigma
subplot(2,2,2);imshow(letterEnhanceGauss);title('Gauss filtered Image(sigma 1.4)');%plot gauss filtered image

letterEnhanceBinarized = im2bw(letterEnhanceGauss,0.3);%apply thresholding to image with 0.3
subplot(2,2,3);imshow(letterEnhanceBinarized);title('Image after thresholding(threshold 0.3)');%plot thresholded image

