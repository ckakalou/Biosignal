%%% All Participants,Experiment T1. bulling + no bulling @every channel %%%
close all
clear all

% Sampling Frequency
fs=250;
% Time
ts=1/fs;
% Length of segment (samples), all the same =200
N=200;
% Set up time axis, same for all channels
tmax=(N-1)*ts;
t=0:ts:tmax;

% Load .mat files
file_names = dir( '*.mat' );
number_of_participants = length( file_names );

for participant = 1:number_of_participants
    
    % Load participant's mat file and save bul/nobul variables
    file_name=file_names(participant).name;
    matfile = load(file_name);
    fldnms = fieldnames(matfile);
	pbul = matfile.(fldnms{1}); % Bullying Data, all channels
    pnobul = matfile.(fldnms{2}); % No Bullying Data, all channels
    
    % Calculate waveforms and ERPs for each channel
    for channel=1:1:256
        bul=pbul(channel,:); % Bullying Data, current channel
        nobul=pnobul(channel,:); % No Bullying Data, current channel
       
        % Smoothing/averaging per participant,bul/nobul,channel
        average_bul=sgolayfilt(bul,4,33);
        average_nobul=sgolayfilt(nobul,4,33);
                
        %% -----------           Create ERPs           ----------- %%
        
        %  Early Posterior Negativity (EPN) : 200-300ms (sample #50 - #75)
        epn_bul{participant,channel}=average_bul(1,50:75);
        epn_nobul{participant,channel}=average_nobul(1,50:75);
        
        %  N170 : 140-180ms (sample #35 - #45) 
        n170_bul{participant,channel}=average_bul(1,35:45);
        n170_nobul{participant,channel}=average_nobul(1,35:45);
        
        %  P300 : 300-500ms (sample #75 - #125)
        p300_bul{participant,channel}=average_bul(1,75:125);
        p300_nobul{participant,channel}=average_nobul(1,75:125);
        
        %  Late Positive Potential : 550-800ms (sample #100 - #175) 
        lpp_bul{participant,channel}=average_bul(1,100:175);
        lpp_nobul{participant,channel}=average_nobul(1,100:175);   
        
    end
end        
%     %% -----------  Plot ERPs ----------- %%
% N_epn=26;
% % Set up time axis, same for all channels
% tmax_epn=(N_epn-1)*ts;
% t_epn=0:ts:tmax_epn;
% count=0;
% % for participant 2 --- EPN Plot
%  figure;
%       title('Participant #2 EPN Bullying');
% for channel=91:120
%     count=count+1;
%      subplot(30,1,count);
%      plot(t_epn,epn_bul{2,channel});
% end
 
% for participant 18 (last remaining value in average_bul) --- whole 256 channel Plot
%  figure;
%       title('Participant #18 Whole Channel Bullying');
%       count2=0;
% for channel=91:120
%     count2=count2+1;
%      subplot(30,1,count2);
%      plot(t,pbul(channel,:));
%  end
        
%         %Create gifs for each case (bul/no bul)
%         gif_delay=1;
%         gif_name_bul=strcat('Participant#',num2str(participant),'_Bulling.gif');
%         gif_name_nobul=strcat('Participant#',num2str(participant),'_No Bulling.gif');
%         gif_createBul(gif_name_bul, bul, average_bul, participant ,channel, t, gif_delay );
%         gif_createNoBul(gif_name_nobul, nobul, average_nobul, participant, channel, t, gif_delay );
    

