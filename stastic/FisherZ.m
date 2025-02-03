function FisherZ(A_path, prefix, suffix, D_path)
    % 定义用户需要提供的两部分文件夹名称
    C_name = [prefix, '_FunImg', suffix];
    disp(['正在查找名为: ', C_name, ' 的文件夹']);

    [~, folderName, ~] = fileparts(A_path);

    % 在D路径中创建ReHo文件夹
    ReHo_path = fullfile(D_path, prefix, folderName);
    if ~exist(ReHo_path, 'dir')
        mkdir(ReHo_path);
    end

    % 初始化一个计数器
    s_index = 1;

    % 遍历A文件夹中的所有文件夹
    foldersA = dir(A_path);
    disp(['正在遍历A文件夹中的文件夹...']);

    for i = 1:length(foldersA)
        if foldersA(i).isdir && ~strcmp(foldersA(i).name, '.') && ~strcmp(foldersA(i).name, '..')
            % 检查文件夹名称是否以Results结尾
            if endsWith(foldersA(i).name, 'Results')
                disp(['找到包含Results的文件夹: ', foldersA(i).name]);

                % 构建B文件夹的完整路径
                B_folder_path = fullfile(A_path, foldersA(i).name);

                % 检查C文件夹是否存在于B文件夹中
                if exist(fullfile(B_folder_path, C_name), 'dir')
                    disp(['在文件夹: ', foldersA(i).name, ' 中找到C文件夹: ', C_name]);

                    % 构建C文件夹的完整路径
                    C_folder_path = fullfile(B_folder_path, C_name);

                    % 找到所有以z + prefix + Map开头的文件ROICorrelation_FisherZ_Sub024
                    file_pattern = ['ROICorrelation_FisherZ', '*.mat'];
                    files = dir(fullfile(C_folder_path, file_pattern));

                    % 重新命名文件夹
                    if strcmp(foldersA(i).name, 'Results')
                        new_folder_name = sprintf('S%d', s_index);
                        s_index = s_index + 1;
                    else
                        % 使用正则表达式提取数字并生成新的文件夹名
                        tokens = regexp(foldersA(i).name, 'S(\d+)_Results', 'tokens');
                        if ~isempty(tokens)
                            new_folder_name = sprintf('S%s', tokens{1}{1});
                        else
                            disp(['无法从文件夹名: ', foldersA(i).name, ' 中提取数字']);
                            continue; % 跳过这个文件夹
                        end
                    end

                    % 在ReHo文件夹中创建A文件夹的副本
                    A_folder_in_D = fullfile(ReHo_path, new_folder_name);
                    if ~exist(A_folder_in_D, 'dir')
                        mkdir(A_folder_in_D);
                        disp(['在ReHo文件夹中创建了文件夹: ', new_folder_name]);
                    end

                    % 将找到的文件复制到D路径中的相应位置
                    for j = 1:length(files)
                        if ~files(j).isdir % 确保是文件而不是文件夹
                            src_file = fullfile(C_folder_path, files(j).name);
                            dest_file = fullfile(A_folder_in_D, files(j).name);
                            copyfile(src_file, dest_file);
                            disp(['复制文件: ', files(j).name, ' 到: ', dest_file]);
                        end
                    end
                else
                    disp(['在文件夹: ', foldersA(i).name, ' 中未找到C文件夹: ', C_name]);
                end
            else
                disp(['文件夹: ', foldersA(i).name, ' 不以Results结尾']);
            end
        end
    end

    disp('处理完成。');
end