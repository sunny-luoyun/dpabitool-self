function FCS(A_path, prefix, suffix, D_path)
    % 定义用户需要提供的两部分文件夹名称
    C_name = [prefix, '_FunImg', suffix];
    disp(['正在查找名为: ', C_name, ' 的文件夹']);

    [~, folderName, ~] = fileparts(A_path);

    % 遍历A文件夹中的所有文件夹
    foldersA = dir(A_path);
    disp(['正在遍历A文件夹中的文件夹...']);

    for i = 1:length(foldersA)
        if foldersA(i).isdir && ~strcmp(foldersA(i).name, '.') && ~strcmp(foldersA(i).name, '..')
            % 检查文件夹名称是否以Results结尾
            if contains(foldersA(i).name, 'ResultsS')
                disp(['找到包含Results的文件夹: ', foldersA(i).name]);

                % 构建B文件夹的完整路径
                B_folder_path = fullfile(A_path, foldersA(i).name);

                % 检查C文件夹是否存在于B文件夹中
                if exist(fullfile(B_folder_path, C_name), 'dir')
                    disp(['在文件夹: ', foldersA(i).name, ' 中找到C文件夹: ', C_name]);

                    % 构建C文件夹的完整路径
                    C_folder_path = fullfile(B_folder_path, C_name);

                    % 找到所有以zROI + prefix + Map开头的文件
                    file_pattern = ['szROI*'];
                    files = dir(fullfile(C_folder_path, file_pattern));

                    % 遍历找到的文件
                    for j = 1:length(files)
                        if ~files(j).isdir % 确保是文件而不是文件夹
                            % 提取文件名中的数字
                            tokens = regexp(files(j).name, ['szROI(\d+)', prefix, 'Map'], 'tokens');
                            if ~isempty(tokens)
                                ROI_number = tokens{1}{1};

                                % 根据ROI数字构建新的文件夹名
                                fc_folder_name = sprintf('%s%s', prefix, ROI_number);

                                % 提取S数字
                                tokensS = regexp(foldersA(i).name, 'S(\d+)_Results', 'tokens');
                                if ~isempty(tokensS)
                                    S_number = tokensS{1}{1};
                                else
                                    S_number = '1'; % 默认为S1
                                end

                                % 构建目标文件夹路径
                                dest_folder_path = fullfile(D_path, fc_folder_name,folderName,  sprintf('S%s', S_number));

                                % 创建目标文件夹路径
                                if ~exist(dest_folder_path, 'dir')
                                    mkdir(dest_folder_path);
                                    disp(['在目标路径中创建了文件夹: ', dest_folder_path]);
                                end

                                % 将找到的文件复制到目标路径
                                src_file = fullfile(C_folder_path, files(j).name);
                                dest_file = fullfile(dest_folder_path, files(j).name);
                                copyfile(src_file, dest_file);
                                disp(['复制文件: ', files(j).name, ' 到: ', dest_file]);
                            else
                                disp(['无法从文件名: ', files(j).name, ' 中提取ROI数字']);
                            end
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