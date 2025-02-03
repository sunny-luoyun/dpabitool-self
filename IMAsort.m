function IMAsort(A, letter, B, C)
    % A: 母文件夹路径
    % letter: 被试文件夹的固定字母
    % B: 需要复制的文件夹名称
    % C: 目标路径

    disp('开始执行IMAsort函数...');

    % 检查路径A是否存在
    if ~exist(A, 'dir')
        error('母文件夹路径不存在: %s', A);
    end

    % 获取母文件夹A中的所有子文件夹
    subfolders = dir(A);
    subfolders = subfolders([subfolders.isdir] & ~ismember({subfolders.name}, {'.', '..'}));

    disp(['找到子文件夹数量: ', num2str(length(subfolders))]);

    % 遍历每个子文件夹
    for i = 1:length(subfolders)
        disp(['正在处理子文件夹: ', subfolders(i).name]);

        % 构建被试文件夹的完整路径
        subject_folder = fullfile(A, subfolders(i).name);

        % 检查文件夹名称是否符合要求
        if endsWith(subfolders(i).name, [letter])
            disp(['找到符合要求的被试文件夹: ', subfolders(i).name]);

            % 递归搜索文件夹B
            [found, source_folder] = findFolder(subject_folder, B);
            if found
                disp(['找到名为B的文件夹，准备复制...']);

                % 提取文件夹名称中的数字部分
                num_part = regexp(subfolders(i).name, ['^([0-9]+)' letter '$'], 'tokens');
                if isempty(num_part)
                    disp(['文件夹名称不符合命名规则，已跳过。']);
                    continue;
                end
                num_part = num_part{1}{1};

                % 构建目标文件夹的完整路径
                target_folder = fullfile(C, ['Sub' num_part]);

                % 检查目标文件夹是否存在，如果不存在则创建
                if ~exist(target_folder, 'dir')
                    mkdir(target_folder);
                    disp(['创建了目标文件夹: ', target_folder]);
                end

                % 复制文件夹B到目标路径C，并重命名
                copyFolder(source_folder, target_folder);
                disp(['文件夹B复制完成，目标路径: ', target_folder]);
            else
                disp(['在文件夹 ', subject_folder, ' 中未找到名为 ', B, ' 的文件夹。']);
            end
        else
            disp(['文件夹 ', subfolders(i).name, ' 不符合命名要求，已跳过。']);
        end
    end

    disp('IMAsort函数执行完成。');
end

function [found, source_folder] = findFolder(folderPath, B)
    % 递归搜索名为B的文件夹
    disp(['搜索文件夹: ', folderPath]);
    contents = dir(folderPath);
    for i = 1:length(contents)
        if strcmp(contents(i).name, B) && contents(i).isdir
            found = true;
            source_folder = fullfile(folderPath, B);
            return;
        elseif contents(i).isdir && ~ismember(contents(i).name, {'.', '..'})
            [found, source_folder] = findFolder(fullfile(folderPath, contents(i).name), B);
            if found
                return;
            end
        end
    end
    found = false;
    source_folder = '';
end

function copyFolder(sourceFolder, targetFolder)
    % 复制文件夹及其内容到目标文件夹
    disp(['复制文件夹: ', sourceFolder, ' 到 ', targetFolder]);

    if ~exist(targetFolder, 'dir')
        mkdir(targetFolder);
        disp(['创建目标文件夹: ', targetFolder]);
    end

    % 确保不会复制文件夹到它自己
    if strcmp(sourceFolder, targetFolder)
        disp('源文件夹和目标文件夹相同，跳过复制。');
        return;
    end

    files = dir(fullfile(sourceFolder, '*'));
    for i = 1:length(files)
        if strcmp(files(i).name, '.') || strcmp(files(i).name, '..')
            continue; % 跳过当前目录和上级目录的引用
        end
        srcFile = fullfile(sourceFolder, files(i).name);
        dstFile = fullfile(targetFolder, files(i).name);
        if files(i).isdir
            % 如果是文件夹，则递归复制
            copyFolder(srcFile, dstFile);
            disp(['递归复制文件夹: ', srcFile, ' 到 ', dstFile]);
        else
            % 如果是文件，则直接复制
            copyfile(srcFile, dstFile);
            disp(['复制文件: ', srcFile, ' 到 ', dstFile]);
        end
    end
end