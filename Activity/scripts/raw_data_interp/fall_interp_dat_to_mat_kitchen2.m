%Fall data extract from .dat  interpolate and save as .mat

sample_size = 2000
% pwd
%% Amplitude extraction
TX_ant = 1;
kitchen_files = dir('../../../fall_data/falldefi/fall_detection/kitchen2/*.dat')

mkdir(fullfile(pwd,'../../../interp/kitchen2/'))
  
for i = 1:length(kitchen_files)
    file_name = kitchen_files(i).name;
    data_file = ['../../../fall_data/falldefi/fall_detection/kitchen2/' file_name];  
    
    [ant1, ant2, ant3] = extract_amp_interp(TX_ant, data_file,10000);

    v = vertcat(ant1,ant2);

    save(['../../../interp/kitchen2/' file_name(1:end-4) '.mat'],'v')
    clear v
end
%