function  generateAndSaveVideos(  )
    addpaths;
    close all;
    %checkpoint = 'checkpoints_dra_T_150_bs_100_tg_10_ls_10_fc_10_demo';
    %folder = '/Users/jromero/RNNexp/structural_rnn/h3.6m/';
    folder = '/Users/jromero/RNNexp/structural_rnn/h3.6m/official_permotion/';
    names = dir(folder);
    db = H36MDataBase.instance;
    for i = 1:numel(names)
        nm = names(i);
        if nm.isdir && ~strcmp(nm.name , '.') && ~strcmp(nm.name , '..')
            disp(nm.name);
            
            %unix(['mkdir -p ',nm.name,'/videos']);
            for N = 0:23 %23
                
                %playGeneratedMotion( nm.name,['ground_truth_forecast_N_',num2str(N),'.dat'],5,false );
                for iterations = 1250
                        %playGeneratedMotion( [folder,nm.name],['forecast_iteration_',num2str(iterations),'_N_',num2str(N),'_conv.csv'],5,false );              
                        playGeneratedMotion( [folder,nm.name],['forecast_N_',num2str(N),'_conv.csv'],5,false );              
                end;
                %figure; plotCells( N );
            end;
        end;
        
    end;

end





