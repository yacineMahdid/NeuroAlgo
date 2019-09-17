function [Recording] = load_set(file_name,path)
%LOAD_EEG will load the EEG data
%   file_name: name of the file to load
%   path: path to that file
%
%   Recording: structure containing the eeg data

    Recording = struct();
    Recording.eeg = [];
    Recording.sampling_rate = -1;
    Recording.number_channels = -1;
    Recording.channels_location = [];
    Recording.channels_info = [];

    % Currently supported format: .set files
    if(strcmp(type,'set'))
        data = pop_loadset(file_name,path);
        Recording.eeg = data.data;
        Recording.sampling_rate = data.srate;
        Recording.number_channels = data.nbchan;
        Recording.channels_location = data.chanlocs;
        Recording.channels_info = data.chaninfo;
    end
end

