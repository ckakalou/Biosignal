% Person #2 bulling + no bulling @every channel
close all
%load person's mat file
load('ptes02 20160704 1141.T1.-0.mat');

%Sampling Frequency
fs=250;
%Time
ts=1/fs;
%Length of channel #1, all the same
N=length(bul_Averageptes02(1,:));
%Set up time axis, same for all channels
tmax=(N-1)*ts;
t=0:ts:tmax;

for channel=1:256
    %bulling data
    p2b=bul_Averageptes02(channel,:);
%     figure;
%     plot(t,p2b);
%     no bullying data
    p2n=nobul_Averageptes02(channel,:);
    %average per person,bul/nobul,channel
    ws = warning('off','all'); % Turn off warnings
    averagep2b=sgolayfilt(p2b,9,199);
    averagep2n=sgolayfilt(p2n,9,199);
    warning(ws)  % Turn warnings back on.
    %Create gifs for each case (bul/no bul)
    gif_delay=1;
    gif_create('Person2_Bullying.gif', averagep2b, channel, t, gif_delay );
    gif_create('Person2_No_Bullying.gif', averagep2n, channel, t, gif_delay );
end
