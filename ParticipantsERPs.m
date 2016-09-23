% All Participants, Experiment T1. bulling + no bulling @every channel
close all
clear all

%Sampling Frequency
fs=250;
%Time
ts=1/fs;
%Length of segment (samples), all the same =200
N=200;
%Set up time axis, same for all channels
tmax=(N-1)*ts;
t=0:ts:tmax;

%Load .mat files
file_names = dir( '*.mat' );
number_of_participants = length( file_names );

for participant = 1:number_of_participants
    
    %Load participant's mat file and save bul/nobul variables
    file_name=file_names(participant).name;
    matfile = load(file_name);
    fldnms = fieldnames(matfile);
	pbul = matfile.(fldnms{1}); %Bullying Data, all channels
    pnobul = matfile.(fldnms{2}); %No Bullying Data, all channels
    
    %Plot waveforms and ERPs for each channel
    for channel=1:1:3
        bul=pbul(channel,:); %Bullying Data, current channel
        nobul=pnobul(channel,:); %No Bullying Data, current channel
        %Average per participant,bul/nobul,channel
        ws = warning('off','all'); % Turn off warnings
        average_bul=sgolayfilt(bul,9,199);
        average_nobul=sgolayfilt(nobul,9,199);
        warning(ws)  % Turn warnings back on.
        %Create gifs for each case (bul/no bul)
        gif_delay=1;
        gif_name_bul=strcat('Participant#',num2str(participant),'_Bulling.gif');
        gif_name_nobul=strcat('Participant#',num2str(participant),'_No Bulling.gif');
        gif_createBul(gif_name_bul, bul, average_bul, participant ,channel, t, gif_delay );
        gif_createNoBul(gif_name_nobul, nobul, average_nobul, participant, channel, t, gif_delay );
    end

end