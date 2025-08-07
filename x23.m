function x23(path, factor1, factor2, level1, level2)
% 定义包含所有子文件夹的路径
fullFolderPath = '/Users/sunny/Applications/spm12';
fullPath = genpath(fullFolderPath);

% 添加路径到 MATLAB 搜索路径
%addpath(fullPath);

% 注册清理函数，确保在脚本结束时删除路径
%cleanupFcn = onCleanup(@() rmpath(fullPath));
outputpath = fullfile(path,'two-way-anvoca');

matlabbatch = {};
matlabbatch{1}.spm.stats.factorial_design.dir = {outputpath};
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).name = factor1;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).levels = 2;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).dept = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).name = factor2;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).levels = 3;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).dept = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(1).levels = [1
                                                                    1];
first = strsplit(level1, ',');
first = strtrim(first);
second = strsplit(level2, ',');
second = strtrim(second);

% 定义基础路径
base_path = fullfile(path,first{1},second{1});

files_info = dir(fullfile(base_path, '*.nii'));

list = {};

for i = 1:numel(files_info)
    full_path = fullfile(base_path, files_info(i).name);
    list{end+1, 1} = {full_path, ',1'}; % 将路径和 ',1' 存储为一个元胞数组
end

% 将列表中的每个元胞数组元素合并为一个字符串
list_combined = cellfun(@(x) [x{1}, x{2}], list, 'UniformOutput', false);

matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(1).scans = list_combined;
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(2).levels = [1
                                                                    2];
% 定义基础路径
base_path = fullfile(path,first{1},second{2});

files_info = dir(fullfile(base_path, '*.nii'));

list = {};

for i = 1:numel(files_info)
    full_path = fullfile(base_path, files_info(i).name);
    list{end+1, 1} = {full_path, ',1'}; % 将路径和 ',1' 存储为一个元胞数组
end

% 将列表中的每个元胞数组元素合并为一个字符串
list_combined = cellfun(@(x) [x{1}, x{2}], list, 'UniformOutput', false);
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(2).scans = list_combined;
                                                                   
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(3).levels = [1
                                                                    3];
% 定义基础路径
base_path = fullfile(path,first{1},second{3});

files_info = dir(fullfile(base_path, '*.nii'));

list = {};

for i = 1:numel(files_info)
    full_path = fullfile(base_path, files_info(i).name);
    list{end+1, 1} = {full_path, ',1'}; % 将路径和 ',1' 存储为一个元胞数组
end

% 将列表中的每个元胞数组元素合并为一个字符串
list_combined = cellfun(@(x) [x{1}, x{2}], list, 'UniformOutput', false);
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(3).scans = list_combined;
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(4).levels = [2
                                                                    1];
% 定义基础路径
base_path = fullfile(path,first{2},second{1});

files_info = dir(fullfile(base_path, '*.nii'));

list = {};

for i = 1:numel(files_info)
    full_path = fullfile(base_path, files_info(i).name);
    list{end+1, 1} = {full_path, ',1'}; % 将路径和 ',1' 存储为一个元胞数组
end

% 将列表中的每个元胞数组元素合并为一个字符串
list_combined = cellfun(@(x) [x{1}, x{2}], list, 'UniformOutput', false);
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(4).scans = list_combined;
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(5).levels = [2
                                                                    2];
% 定义基础路径
base_path = fullfile(path,first{2},second{2});

files_info = dir(fullfile(base_path, '*.nii'));

list = {};

for i = 1:numel(files_info)
    full_path = fullfile(base_path, files_info(i).name);
    list{end+1, 1} = {full_path, ',1'}; % 将路径和 ',1' 存储为一个元胞数组
end

% 将列表中的每个元胞数组元素合并为一个字符串
list_combined = cellfun(@(x) [x{1}, x{2}], list, 'UniformOutput', false);
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(5).scans = list_combined;
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(6).levels = [2
                                                                    3];
% 定义基础路径
base_path = fullfile(path,first{2},second{3});

files_info = dir(fullfile(base_path, '*.nii'));

list = {};

for i = 1:numel(files_info)
    full_path = fullfile(base_path, files_info(i).name);
    list{end+1, 1} = {full_path, ',1'}; % 将路径和 ',1' 存储为一个元胞数组
end

% 将列表中的每个元胞数组元素合并为一个字符串
list_combined = cellfun(@(x) [x{1}, x{2}], list, 'UniformOutput', false);
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(6).scans = list_combined;
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.contrasts = 1;
matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};
matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;
matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('Factorial design specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;

spm_jobman('run', matlabbatch)



