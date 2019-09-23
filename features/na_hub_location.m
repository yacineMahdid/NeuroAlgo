function [outputArg1,outputArg2] = na_hub_location(recording, frequency_band, number_surrogate, p_value ,is_verbose)
%NA_HUB_LOCATION Summary of this function goes here
%   Detailed explanation goes here
    result = Result('hub location', recording);
    filtered_data = recording.filter_data(recording.data, frequency_band);
    windowed_data = recording.create_window(filtered_data, window_size);
    [number_window,~,~] = size(windowed_data);
    %% Calculation on the windowed segments
    result.data.hub_location = zeros(number_window, recording.number_channels, recording.number_channels);
    for i = 1:number_window
       if(is_verbose)
          disp(strcat("wPLI at window: ",string(i)," of ", string(number_window))); 
       end
       segment_data = squeeze(windowed_data(i,:,:));
       segment_wpli = wpli(segment_data, number_surrogate, p_value); 
       result.data.wpli(i,:,:) = segment_wpli;
    end
end
