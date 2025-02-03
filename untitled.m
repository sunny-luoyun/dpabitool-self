% 定义基础路径
base_path = fullfile('');

% 获取文件夹内所有 .nii 文件的信息
files_info = dir(fullfile(base_path, '*.nii'));

% 创建一个空的单元数组来存储完整的文件路径和逗号
list = {};

% 循环遍历文件信息，为每个文件添加路径和逗号
for i = 1:numel(files_info)
    % 构建完整的文件路径和格式
    full_path = fullfile(base_path, files_info(i).name);
    % 将路径和逗号添加到 list 数组中
    list{end+1} = [full_path, ',1'];
end

% 现在 list 变量包含了文件夹内所有 .nii 文件的完整路径和逗号
disp(list);

% 将 list 赋值给 matlabbatch 结构体中的 scans 字段
%matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(1).scans = list;