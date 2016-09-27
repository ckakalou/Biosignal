close all
fs=250;

N=200;
ts=1/fs;
tmax=(N-1)*ts;
t=0:ts:tmax;

epn_bul={};
epn_nobul={};
for channel=1:256;
p2b=bul_Averageptes02(channel,:);
p2n=nobul_Averageptes02(channel,:);

averagep2b=sgolayfilt(p2b,4,33);
averagep2n=sgolayfilt(p2n,4,33);

epn_bul{channel}=averagep2b(1,50:75);
epn_nobul{channel}=averagep2n(1,50:75);

end

figure; plot(epn_bul{1,120}); hold on; plot(epn_nobul{1,120})
% warning(ws)  % Turn it back on.
% figure
% hold on
% plot(t,p2bc1);
% title('person #2 bullying');
% hold on
% plot(t,averagep2bc1SG9);
% set(gca,'ydir','reverse')
% figure
% hold on
% plot(t,p2nc1);
% title('person #2 no bullying');
% set(gca,'ydir','reverse')
% hold on
% plot(t,averagep2nc1SG9);
% figure
% hold on
% plot(t,averagep2bc1SG9);
% set(gca,'ydir','reverse')
% title('person #2 ERP bullying and no bullying');
% hold on
% plot(t,averagep2nc1SG9);
% set(gca,'ydir','reverse')
