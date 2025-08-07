function IMAsort(A, letter, B, C)
% A: 母文件夹路径
% letter: 被试文件夹前缀，如 'sub'、'S'、'A' 等
% B:   需要复制的文件夹关键词（子串匹配）
% C:   目标根目录

    disp('开始执行IMAsort函数...');

    % ---------- 参数检查 ----------
    if ~exist(A, 'dir')
        error('母文件夹路径不存在: %s', A);
    end

    % ---------- 获取所有一级子文件夹 ----------
    subfolders = dir(A);
    subfolders = subfolders([subfolders.isdir] & ...
                            ~ismember({subfolders.name}, {'.', '..'}));
    disp(['找到子文件夹数量: ', num2str(numel(subfolders))]);

    % ---------- 主循环 ----------
    for k = 1:numel(subfolders)
        thisSub = subfolders(k).name;
        disp(['正在处理: ', thisSub]);

        % 1) 前缀匹配（不区分大小写）
        pattern = ['^' letter '\d+' '$'];      % 如 ^sub\d+$
        if ~~regexp(thisSub, pattern, 'once', 'ignorecase')
            disp('  不符合前缀规则，跳过');
            continue;
        end

        % 2) 提取数字部分
        tok = regexp(thisSub, ['^' letter '(\d+)'], 'tokens', 'ignorecase');
        if isempty(tok)
            disp('  无法提取数字，跳过');
            continue;
        end
        subNum = tok{1}{1};

        % 3) 递归模糊查找关键词
        subjectPath = fullfile(A, thisSub);
        [found, sourcePath] = findFolderFuzzy(subjectPath, B);
        if ~found
            disp(['  未找到包含 "', B, '" 的子文件夹，跳过']);
            continue;
        end

        % 4) 准备目标路径并复制
        targetPath = fullfile(C, ['Sub' subNum]);
        if ~exist(targetPath, 'dir')
            mkdir(targetPath);
            disp(['  创建目标文件夹: ', targetPath]);
        end
        copyFolder(sourcePath, targetPath);
        disp(['  复制完成: ', sourcePath, ' -> ', targetPath]);
    end

    disp('IMAsort函数执行完成。');
end

%% ---------- 模糊搜索子文件夹 ----------
function [found, sourcePath] = findFolderFuzzy(root, keyword)
    % 深度优先递归
    contents = dir(root);
    for i = 1:numel(contents)
        name = contents(i).name;
        if ismember(name, {'.', '..'}), continue; end

        fullname = fullfile(root, name);

        if contents(i).isdir
            % 如果当前目录名包含关键词（不区分大小写）
            if contains(lower(name), lower(keyword))
                found = true;
                sourcePath = fullname;
                return;
            end
            % 继续向下层搜索
            [found, sourcePath] = findFolderFuzzy(fullname, keyword);
            if found, return; end
        end
    end
    found = false;
    sourcePath = '';
end

%% ---------- 递归复制 ----------
function copyFolder(src, dst)
    % 和原函数相同，可保留原实现
    if strcmp(src, dst)
        disp('  源与目标相同，跳过');
        return;
    end
    if ~exist(dst, 'dir')
        mkdir(dst);
    end
    files = dir(fullfile(src, '*'));
    for i = 1:numel(files)
        if ismember(files(i).name, {'.', '..'}), continue; end
        srcFile = fullfile(src, files(i).name);
        dstFile = fullfile(dst, files(i).name);
        if files(i).isdir
            copyFolder(srcFile, dstFile);
        else
            copyfile(srcFile, dstFile);
        end
    end
end