function measure = evaluate_datasets(ground_truth_path, estimation_path)
    measures = [];
    files = dir(strcat(estimation_path,filesep,"*.bmp"));
    for k = 1:length(files)
        f_name = files(k).name;
        e_mask = strcat(estimation_path,filesep,f_name);
        gt_mask = strcat(ground_truth_path,filesep,f_name);
        map_gt=double(imread(gt_mask));
        map_est = double(imread(e_mask));
        measure = f_measure(map_gt,map_est);
        measures = [measures measure];
        fprintf('%s -> %3.4f\n',f_name,measure);
    end
    measure = mean(measures);
end