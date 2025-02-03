% 设置A文件夹的路径
folderPath = '/Users/sunny/Desktop/test'; % 请根据实际情况修改这里的路径

% 获取A文件夹下的所有文件
files = dir(fullfile(folderPath, '*.*')); % 这里假设你想要更改所有类型的文件

% 循环遍历所有文件
for i = 1:length(files)
    % 检查是否是文件（排除目录）
    if ~files(i).isdir
        % 获取原始文件名
        originalName = files(i).name;
        
        % 定义新的文件名，在文件名开头添加"ac"
        newName = ['ac' originalName];
        
        % 构建完整的文件路径
        originalFullPath = fullfile(folderPath, originalName);
        newFullPath = fullfile(folderPath, newName);
        
        % 重命名文件
        movefile(originalFullPath, newFullPath);
    end
end

% 提示完成
disp('文件名更改完成！');
