classdef Better < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure             matlab.ui.Figure
        Panel_3              matlab.ui.container.Panel
        ButtonGroup_6        matlab.ui.container.ButtonGroup
        StdButton            matlab.ui.control.RadioButton
        MeanButton           matlab.ui.control.RadioButton
        CVButton             matlab.ui.control.RadioButton
        ButtonGroup_3        matlab.ui.container.ButtonGroup
        resultsSButton       matlab.ui.control.RadioButton
        resultsButton        matlab.ui.control.RadioButton
        zLabel               matlab.ui.control.Label
        ARCWSFEditField      matlab.ui.control.EditField
        Label_12             matlab.ui.control.Label
        ButtonGroup_5        matlab.ui.container.ButtonGroup
        fALFFCheckBox_2      matlab.ui.control.CheckBox
        ALFFCheckBox_2       matlab.ui.control.CheckBox
        ReHoCheckBox_2       matlab.ui.control.CheckBox
        FCCheckBox           matlab.ui.control.CheckBox
        ButtonGroup_4        matlab.ui.container.ButtonGroup
        FisherZCheckBox      matlab.ui.control.CheckBox
        ROISignalsCheckBox   matlab.ui.control.CheckBox
        fALFFCheckBox        matlab.ui.control.CheckBox
        ALFFCheckBox         matlab.ui.control.CheckBox
        ReHoCheckBox         matlab.ui.control.CheckBox
        FCROIxFCMapCheckBox  matlab.ui.control.CheckBox
        Button_16            matlab.ui.control.Button
        Button_15            matlab.ui.control.Button
        EditField_10         matlab.ui.control.EditField
        Label_11             matlab.ui.control.Label
        Button_12            matlab.ui.control.Button
        EditField_9          matlab.ui.control.EditField
        Label_10             matlab.ui.control.Label
        Panel_2              matlab.ui.container.Panel
        Button_11            matlab.ui.control.Button
        Button_re            matlab.ui.control.Button
        Button_10            matlab.ui.control.Button
        EditField_8          matlab.ui.control.EditField
        Label_9              matlab.ui.control.Label
        IMAEditField         matlab.ui.control.EditField
        IMALabel             matlab.ui.control.Label
        TITIEditField        matlab.ui.control.EditField
        TITIEditFieldLabel   matlab.ui.control.Label
        Button_9             matlab.ui.control.Button
        EditField_7          matlab.ui.control.EditField
        Label_8              matlab.ui.control.Label
        ButtonGroup          matlab.ui.container.ButtonGroup
        Button_8             matlab.ui.control.RadioButton
        Button_7             matlab.ui.control.RadioButton
        EditField_6          matlab.ui.control.EditField
        Label_7              matlab.ui.control.Label
        Button_6             matlab.ui.control.Button
        EditField_5          matlab.ui.control.EditField
        Label_5              matlab.ui.control.Label
        Button_5             matlab.ui.control.Button
        EditField_4          matlab.ui.control.EditField
        EditField_4Label     matlab.ui.control.Label
        EditField_3          matlab.ui.control.EditField
        Label_4              matlab.ui.control.Label
        Button_4             matlab.ui.control.Button
        X2CheckBox           matlab.ui.control.CheckBox
        CheckBox             matlab.ui.control.CheckBox
        TCheckBox            matlab.ui.control.CheckBox
        Button               matlab.ui.control.Button
        Spinner_2            matlab.ui.control.Spinner
        Spinner_2Label       matlab.ui.control.Label
        Spinner              matlab.ui.control.Spinner
        Label_2              matlab.ui.control.Label
        Panel                matlab.ui.container.Panel
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: Button_6
        function Button_6Pushed(app, event)
            % 弹出文件夹选择对话框
            folderPath = uigetdir();  % 用户选择的文件夹路径
            if isequal(folderPath, 0)
                disp('用户取消了选择');
                figure(app.UIFigure)
            else
                % 将选择的文件夹路径设置到EditField_6中
                app.EditField_6.Value = folderPath;
                figure(app.UIFigure)
            end
        end

        % Button pushed function: Button
        function ButtonPushed(app, event)
            mix
        end

        % Button pushed function: Button
        function Button_rePushed(app, event)
            rename
        end

        % Button pushed function: Button_5
        function Button_5Pushed(app, event)
            % 弹出文件夹选择对话框
            folderPath = uigetdir();  % 用户选择的文件夹路径
            if isequal(folderPath, 0)
                disp('用户取消了选择');
                figure(app.UIFigure)
            else
                % 将选择的文件夹路径设置到EditField_6中
                app.EditField_5.Value = folderPath;
                figure(app.UIFigure)
            end
        end

        % Button pushed function: Button_4
        function Button_4Pushed(app, event)
            if app.Button_8.Value
                singal(app);
            else
                % 检查复选框状态并执行相应的统计分析
                if app.TCheckBox.Value
                    % 如果 T检验被选中，执行 T检验
                    performTTest(app);
                end
            
                if app.CheckBox.Value
                    % 如果单因素重复测量方差分析被选中，执行单因素重复测量方差分析
                    performOneWayANOVA(app);
                end
            
                if app.X2CheckBox.Value
                    % 如果双因素重复测量方差分析（2X2）被选中，执行双因素重复测量方差分析
                    performTwoWayANOVA(app);
                end
            end
        end

        % Button pushed function: Button_9
        function Button_9Pushed(app, event)
            % 弹出文件夹选择对话框
            folderPath = uigetdir();  % 用户选择的文件夹路径
            if isequal(folderPath, 0)
                disp('用户取消了选择');
                figure(app.UIFigure)
            else
                % 将选择的文件夹路径设置到EditField_6中
                app.EditField_7.Value = folderPath;
                figure(app.UIFigure)
            end
        end

        % Button pushed function: Button_10
        function Button_10Pushed(app, event)
            % 弹出文件夹选择对话框
            folderPath = uigetdir();  % 用户选择的文件夹路径
            if isequal(folderPath, 0)
                disp('用户取消了选择');
                figure(app.UIFigure)
            else
                % 将选择的文件夹路径设置到EditField_6中
                app.EditField_8.Value = folderPath;
                figure(app.UIFigure)
            end
        end

        % Button pushed function: Button_11
        function Button_11Pushed(app, event)
            A = app.EditField_7.Value;
            letter = app.TITIEditField.Value;
            B = app.IMAEditField.Value;
            C = app.EditField_8.Value;
            
            IMAsort(A, letter, B, C);
            
        end

        % Button pushed function: Button_12
        function Button_12Pushed(app, event)
            % 弹出文件夹选择对话框
            folderPath = uigetdir();  % 用户选择的文件夹路径
            if isequal(folderPath, 0)
                disp('用户取消了选择');
                figure(app.UIFigure)
            else
                % 将选择的文件夹路径设置到EditField_6中
                app.EditField_9.Value = folderPath;
                figure(app.UIFigure)
            end
        end

        % Button pushed function: Button_15
        function Button_15Pushed(app, event)
            % 弹出文件夹选择对话框
            folderPath = uigetdir();  % 用户选择的文件夹路径
            if isequal(folderPath, 0)
                disp('用户取消了选择');
                figure(app.UIFigure)
            else
                % 将选择的文件夹路径设置到EditField_6中
                app.EditField_10.Value = folderPath;
                figure(app.UIFigure)
            end
        end

        % Button Group
        function ButtonGroupSelectionChanged2(app, event)
            selectedButton = event.NewValue;

            if selectedButton == app.Button_7
                app.TCheckBox.Enable = 'on';
                app.CheckBox.Enable = "on";
                app.X2CheckBox.Enable = 'on';

            elseif selectedButton == app.Button_8
                app.CheckBox.Value = false;
                app.TCheckBox.Value = false;
                app.X2CheckBox.Value = false;
                
                app.TCheckBox.Enable = 'off';
                app.CheckBox.Enable = "off";
                app.X2CheckBox.Enable = 'off';
     
            end           
        end

        % Button Group_3
        function ButtonGroup3SelectionChanged2(app, event)
            selectedButton3 = event.NewValue;

            if selectedButton3 == app.resultsButton
                app.ROISignalsCheckBox.Enable = "on";
                app.FisherZCheckBox.Enable = 'on';

                app.FCCheckBox.Enable ="on";
                app.ReHoCheckBox_2.Enable ="on";
                app.fALFFCheckBox_2.Enable ="on";
                app.ALFFCheckBox_2.Enable ="on";
                app.CVButton.Enable ="on";
                app.MeanButton.Enable ="on";
                app.StdButton.Enable ="on";

            elseif selectedButton3 == app.resultsSButton
                app.ROISignalsCheckBox.Value = false;
                app.FisherZCheckBox.Value = false;

                app.FCCheckBox.Value = false;
                app.ReHoCheckBox_2.Value = false;
                app.fALFFCheckBox_2.Value = false;
                app.ALFFCheckBox_2.Value = false;
                app.CVButton.Value = false;
                app.MeanButton.Value = false;
                app.StdButton.Value = false;

                app.ROISignalsCheckBox.Enable = "off";
                app.FisherZCheckBox.Enable = 'off';

                app.FCCheckBox.Enable = "off";
                app.ReHoCheckBox_2.Enable = 'off';
                app.fALFFCheckBox_2.Enable = "off";
                app.ALFFCheckBox_2.Enable = 'off';
                app.CVButton.Enable = "off";
                app.MeanButton.Enable = 'off';
                app.StdButton.Enable = "off";
            end           
        end

        

        % Button pushed function: Button_16
        function Button_16Pushed(app, event)
            if app.resultsButton.Value
                if app.FCROIxFCMapCheckBox.Value
                    A_path = app.EditField_9.Value;
                    prefix = 'FC';
                    suffix = app.ARCWSFEditField.Value;
                    D_path = app.EditField_10.Value;
                    FC(A_path, prefix, suffix, D_path);
                end

                if app.ReHoCheckBox.Value
                    A_path = app.EditField_9.Value;
                    prefix = 'ReHo';
                    suffix = app.ARCWSFEditField.Value;
                    D_path = app.EditField_10.Value;
                    RF(A_path, prefix, suffix, D_path);
                end

                if app.fALFFCheckBox.Value
                    A_path = app.EditField_9.Value;
                    prefix = 'fALFF';
                    suffix = app.ARCWSFEditField.Value;
                    D_path = app.EditField_10.Value;
                    RF(A_path, prefix, suffix, D_path);
                end

                if app.ALFFCheckBox.Value
                    A_path = app.EditField_9.Value;
                    prefix = 'ALFF';
                    suffix = app.ARCWSFEditField.Value;
                    D_path = app.EditField_10.Value;
                    RF(A_path, prefix, suffix, D_path);
                end

                if app.ROISignalsCheckBox.Value
                    A_path = app.EditField_9.Value;
                    prefix = 'ROISignals';
                    suffix = app.ARCWSFEditField.Value;
                    D_path = app.EditField_10.Value;
                    FisherZ(A_path, prefix, suffix, D_path);
                end

                if app.FisherZCheckBox.Value
                    A_path = app.EditField_9.Value;
                    prefix = 'ROISignals';
                    suffix = app.ARCWSFEditField.Value;
                    D_path = app.EditField_10.Value;
                    ROI(A_path, prefix, suffix, D_path);
                end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  动态CV  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                if app.CVButton.Value
                    if app.FCCheckBox.Value
                        A_path = app.EditField_9.Value;
                        prefix = 'FC';
                        suffix = app.ARCWSFEditField.Value;
                        D_path = app.EditField_10.Value;
                        dFCcv(A_path, prefix, suffix, D_path);
                    end
                    if app.ReHoCheckBox_2.Value
                        A_path = app.EditField_9.Value;
                        prefix = 'ReHo';
                        suffix = app.ARCWSFEditField.Value;
                        D_path = app.EditField_10.Value;
                        dRFcv(A_path, prefix, suffix, D_path);
                    end
                    if app.ALFFCheckBox_2.Value
                        A_path = app.EditField_9.Value;
                        prefix = 'ALFF';
                        suffix = app.ARCWSFEditField.Value;
                        D_path = app.EditField_10.Value;
                        dRFcv(A_path, prefix, suffix, D_path);
                    end
                    if app.fALFFCheckBox_2.Value
                        A_path = app.EditField_9.Value;
                        prefix = 'fALFF';
                        suffix = app.ARCWSFEditField.Value;
                        D_path = app.EditField_10.Value;
                        dRFcv(A_path, prefix, suffix, D_path);
                    end
                end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  动态Mean  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                if app.MeanButton.Value
                    if app.FCCheckBox.Value
                        A_path = app.EditField_9.Value;
                        prefix = 'FC';
                        suffix = app.ARCWSFEditField.Value;
                        D_path = app.EditField_10.Value;
                        dFCmean(A_path, prefix, suffix, D_path);
                    end
                    if app.ReHoCheckBox_2.Value
                        A_path = app.EditField_9.Value;
                        prefix = 'ReHo';
                        suffix = app.ARCWSFEditField.Value;
                        D_path = app.EditField_10.Value;
                        dRFmean(A_path, prefix, suffix, D_path);
                    end
                    if app.ALFFCheckBox_2.Value
                        A_path = app.EditField_9.Value;
                        prefix = 'ALFF';
                        suffix = app.ARCWSFEditField.Value;
                        D_path = app.EditField_10.Value;
                        dRFmean(A_path, prefix, suffix, D_path);
                    end
                    if app.fALFFCheckBox_2.Value
                        A_path = app.EditField_9.Value;
                        prefix = 'fALFF';
                        suffix = app.ARCWSFEditField.Value;
                        D_path = app.EditField_10.Value;
                        dRFmean(A_path, prefix, suffix, D_path);
                    end
                end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  动态Std  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                
                if app.StdButton.Value
                    if app.FCCheckBox.Value
                        A_path = app.EditField_9.Value;
                        prefix = 'FC';
                        suffix = app.ARCWSFEditField.Value;
                        D_path = app.EditField_10.Value;
                        dFCstd(A_path, prefix, suffix, D_path);
                    end
                    if app.ReHoCheckBox_2.Value
                        A_path = app.EditField_9.Value;
                        prefix = 'ReHo';
                        suffix = app.ARCWSFEditField.Value;
                        D_path = app.EditField_10.Value;
                        dRFstd(A_path, prefix, suffix, D_path);
                    end
                    if app.ALFFCheckBox_2.Value
                        A_path = app.EditField_9.Value;
                        prefix = 'ALFF';
                        suffix = app.ARCWSFEditField.Value;
                        D_path = app.EditField_10.Value;
                        dRFstd(A_path, prefix, suffix, D_path);
                    end
                    if app.fALFFCheckBox_2.Value
                        A_path = app.EditField_9.Value;
                        prefix = 'fALFF';
                        suffix = app.ARCWSFEditField.Value;
                        D_path = app.EditField_10.Value;
                        dRFstd(A_path, prefix, suffix, D_path);
                    end
                end
            end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  平滑  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if app.resultsSButton.Value
                if app.FCROIxFCMapCheckBox.Value
                    A_path = app.EditField_9.Value;
                    prefix = 'FC';
                    suffix = app.ARCWSFEditField.Value;
                    D_path = app.EditField_10.Value;
                    FCS(A_path, prefix, suffix, D_path);
                end

                if app.ReHoCheckBox.Value
                    A_path = app.EditField_9.Value;
                    prefix = 'ReHo';
                    suffix = app.ARCWSFEditField.Value;
                    D_path = app.EditField_10.Value;
                    RFS(A_path, prefix, suffix, D_path);
                end

                if app.fALFFCheckBox.Value
                    A_path = app.EditField_9.Value;
                    prefix = 'fALFF';
                    suffix = app.ARCWSFEditField.Value;
                    D_path = app.EditField_10.Value;
                    RFS(A_path, prefix, suffix, D_path);
                end

                if app.ALFFCheckBox.Value
                    A_path = app.EditField_9.Value;
                    prefix = 'ALFF';
                    suffix = app.ARCWSFEditField.Value;
                    D_path = app.EditField_10.Value;
                    RFS(A_path, prefix, suffix, D_path);
                end
            end
        end
        % 执行 T检验的示例函数
        function performTTest(app)
            conditionInput = app.EditField_3.Value;
            timePointInput = app.EditField_4.Value;

            Conditions = strtrim(strsplit(conditionInput, ','));
            TimePoints = strtrim(strsplit(timePointInput, ','));
            BasePath = app.EditField_6.Value;
            OutputBaseName = fullfile(BasePath, 'Paired-T');  
            if ~exist(OutputBaseName, 'dir')
                mkdir(OutputBaseName);
            end
            
            MaskFile = '';
            CovariateDirs = {};
            OtherCovariates = {};
            PALMSettings = [];
            
            % 同一组内
            for i = 1:length(Conditions)
                for j = 1:length(TimePoints)
                    for k = j+1:length(TimePoints)  
                        TimePointDir1 = fullfile(BasePath, Conditions{i}, TimePoints{j});
                        TimePointDir2 = fullfile(BasePath, Conditions{i}, TimePoints{k});
                        OutputName = fullfile(OutputBaseName, sprintf('%s-%s-%s', Conditions{i}, TimePoints{j}, TimePoints{k}));
                        DependentDirs = {TimePointDir1, TimePointDir2};
                        [TTestPaired_T, Header] = y_TTestPaired_Image(DependentDirs, OutputName, MaskFile, CovariateDirs, OtherCovariates, PALMSettings);
                        
                    end
                end
            end
            
            % 同一时间内
            for j = 1:length(TimePoints)
                for i = 1:(length(Conditions) - 1)
                    TimePointDir1 = fullfile(BasePath, Conditions{i}, TimePoints{j});
                    TimePointDir2 = fullfile(BasePath, Conditions{i+1}, TimePoints{j});
                    OutputName = fullfile(OutputBaseName, sprintf('%s-%s-%s', Conditions{i}, TimePoints{j}, Conditions{i+1}));
                    DependentDirs = {TimePointDir1, TimePointDir2};
                    [TTestPaired_T, Header] = y_TTestPaired_Image(DependentDirs, OutputName, MaskFile, CovariateDirs, OtherCovariates, PALMSettings);
                end
            end
            
            files = dir(OutputBaseName);
            
            for i = 1:length(files)
                if contains(files(i).name, '_Cohen_f2')
                    fullPath = fullfile(OutputBaseName, files(i).name);
                    delete(fullPath);
                end
            end
        end

        
        % 执行单因素重复测量方差分析的示例函数
        function performOneWayANOVA(app)
            
        end
        
        % 执行双因素重复测量方差分析
        function performTwoWayANOVA(app)
            BasePath = app.EditField_6.Value;
           OutputBaseName = fullfile(BasePath, 'mix-ancova');  
            if ~exist(OutputBaseName, 'dir')
                mkdir(OutputBaseName);
            end
            MaskFile = '';
            CovariateDirs = {};
            OtherCovariates = {};
            PALMSettings = [];
            
            OutputName = fullfile(OutputBaseName, 'mix');
            
            c = {};
            conditionInput = app.EditField_3.Value;
            timePointInput = app.EditField_4.Value;
            
            subjects = strtrim(strsplit(conditionInput, ','));
            
            for i = 1:length(subjects)
                subjectPath = fullfile(BasePath, subjects{i}); 
                sessions = strtrim(strsplit(timePointInput, ','));
                
                for j = 1:length(sessions)
                    sessionPath = fullfile(subjectPath, sessions{j}); 
                    c{end+1} = sessionPath; 
                end
            end
            
            y_MixedEffectsAnalysis_Image(c,OutputName,MaskFile,CovariateDirs,OtherCovariates, PALMSettings)
            
            files = dir(OutputBaseName);
            
            for i = 1:length(files)
                if contains(files(i).name, '_Cohen_f2')
                    fullPath = fullfile(OutputBaseName, files(i).name);
                    delete(fullPath);
                end
            end
        end

        function singal(app)
            % 工作目录
            BatchBasePath = app.EditField_5.Value;
            
            
            baseDirs = dir(fullfile(BatchBasePath, '*'));
            
            % 定义条件和时间点
            conditionInput = app.EditField_3.Value;
            timePointInput = app.EditField_4.Value;

            Conditions = strtrim(strsplit(conditionInput, ','));
            TimePoints = strtrim(strsplit(timePointInput, ','));
            
            
            PALMSettings = [];
            
            
            for i = 1:length(baseDirs)
                if baseDirs(i).isdir && ~strcmp(baseDirs(i).name, '.') && ~strcmp(baseDirs(i).name, '..') % 确保是目录，并且不是当前目录和上级目录
                    BasePath = fullfile(BatchBasePath, baseDirs(i).name);
                    
                
                    OutputBaseName = fullfile(BasePath, 'Paired-T');
                    if ~exist(OutputBaseName, 'dir')
                        mkdir(OutputBaseName);
                    end
                    
                   
                    for j = 1:length(Conditions)
                        for k = 1:length(TimePoints)
                            for l = k+1:length(TimePoints)
                                TimePointDir1 = fullfile(BasePath, Conditions{j}, TimePoints{k});
                                TimePointDir2 = fullfile(BasePath, Conditions{j}, TimePoints{l});
                                OutputName = fullfile(OutputBaseName, sprintf('%s-%s-%s', Conditions{j}, TimePoints{k}, TimePoints{l}));
                                DependentDirs = {TimePointDir1, TimePointDir2};
                               
                                [TTestPaired_T, Header] = y_TTestPaired_Image(DependentDirs, OutputName, '', {}, {}, PALMSettings);
                            end
                        end
                    end
                    
                    
                    files = dir(fullfile(OutputBaseName, '*_Cohen_f2*')); 
                    for f = 1:length(files)
                        if files(f).isdir
                            continue; 
                        end
                        fullPath = fullfile(OutputBaseName, files(f).name);
                        delete(fullPath);
                    end
                end
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 680 549];
            app.UIFigure.Name = '适合宝宝体质的工具';

            % Create Panel
            app.Panel = uipanel(app.UIFigure);
            app.Panel.Title = '统计';
            app.Panel.Position = [7 6 374 306];

            % Create Label_2
            app.Label_2 = uilabel(app.UIFigure);
            app.Label_2.HorizontalAlignment = 'right';
            app.Label_2.Position = [13 219 60 22];
            app.Label_2.Text = '因子1水平';

            % Create Spinner
            app.Spinner = uispinner(app.UIFigure);
            app.Spinner.Position = [88 219 90 22];

            % Create Spinner_2Label
            app.Spinner_2Label = uilabel(app.UIFigure);
            app.Spinner_2Label.HorizontalAlignment = 'right';
            app.Spinner_2Label.Position = [13 189 60 22];
            app.Spinner_2Label.Text = '因子2水平';

            % Create Spinner_2
            app.Spinner_2 = uispinner(app.UIFigure);
            app.Spinner_2.Position = [88 189 90 22];

            % Create Button
            app.Button = uibutton(app.UIFigure, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.Position = [22 85 117 24];
            app.Button.Text = '更多';

            % Create TCheckBox
            app.TCheckBox = uicheckbox(app.UIFigure);
            app.TCheckBox.Tag = 'pairT';
            app.TCheckBox.Text = 'T检验';
            app.TCheckBox.Position = [166 148 53 22];

            % Create CheckBox
            app.CheckBox = uicheckbox(app.UIFigure);
            app.CheckBox.Tag = 'oneway';
            app.CheckBox.Text = '单因素重复测量方差分析';
            app.CheckBox.Position = [166 118 154 22];

            % Create X2CheckBox
            app.X2CheckBox = uicheckbox(app.UIFigure);
            app.X2CheckBox.Tag = 'mixway';
            app.X2CheckBox.Text = '双因素重复测量方差分析（仅2X2）';
            app.X2CheckBox.Position = [166 86 212 22];

            % Create Button_4
            app.Button_4 = uibutton(app.UIFigure, 'push');
            app.Button_4.ButtonPushedFcn = createCallbackFcn(app, @Button_4Pushed, true);
            app.Button_4.Position = [290 10 76 24];
            app.Button_4.Text = '开始统计';

            % Create Label_4
            app.Label_4 = uilabel(app.UIFigure);
            app.Label_4.HorizontalAlignment = 'right';
            app.Label_4.Position = [191 219 65 22];
            app.Label_4.Text = '各水平名称';

            % Create EditField_3
            app.EditField_3 = uieditfield(app.UIFigure, 'text');
            app.EditField_3.Position = [272 219 100 22];

            % Create EditField_4Label
            app.EditField_4Label = uilabel(app.UIFigure);
            app.EditField_4Label.HorizontalAlignment = 'right';
            app.EditField_4Label.Position = [191 189 65 22];
            app.EditField_4Label.Text = '各水平名称';

            % Create EditField_4
            app.EditField_4 = uieditfield(app.UIFigure, 'text');
            app.EditField_4.Position = [272 189 100 22];

            % Create Button_5
            app.Button_5 = uibutton(app.UIFigure, 'push');
            app.Button_5.ButtonPushedFcn = createCallbackFcn(app, @Button_5Pushed, true);
            app.Button_5.Position = [339 50 27 21];
            app.Button_5.Text = {'...'; ''};

            % Create Label_5
            app.Label_5 = uilabel(app.UIFigure);
            app.Label_5.HorizontalAlignment = 'right';
            app.Label_5.Position = [7 49 53 22];
            app.Label_5.Text = '单组路径';

            % Create EditField_5
            app.EditField_5 = uieditfield(app.UIFigure, 'text');
            app.EditField_5.Position = [76 49 251 22];

            % Create Button_6
            app.Button_6 = uibutton(app.UIFigure, 'push');
            app.Button_6.ButtonPushedFcn = createCallbackFcn(app, @Button_6Pushed, true);
            app.Button_6.Position = [339 259 27 21];
            app.Button_6.Text = {'...'; ''};

            % Create Label_7
            app.Label_7 = uilabel(app.UIFigure);
            app.Label_7.HorizontalAlignment = 'right';
            app.Label_7.Position = [7 258 53 22];
            app.Label_7.Text = '工作路径';

            % Create EditField_6
            app.EditField_6 = uieditfield(app.UIFigure, 'text');
            app.EditField_6.Position = [76 258 251 22];

            % Create ButtonGroup
            app.ButtonGroup = uibuttongroup(app.UIFigure);
            app.ButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ButtonGroupSelectionChanged2, true);
            app.ButtonGroup.TitlePosition = 'centertop';
            app.ButtonGroup.Position = [21 123 123 53];

            % Create Button_7
            app.Button_7 = uiradiobutton(app.ButtonGroup);
            app.Button_7.Text = '多组单次';
            app.Button_7.Position = [11 26 70 22];
            app.Button_7.Value = true;

            % Create Button_8
            app.Button_8 = uiradiobutton(app.ButtonGroup);
            app.Button_8.Text = '单组多次';
            app.Button_8.Position = [11 4 70 22];

            % Create Panel_2
            app.Panel_2 = uipanel(app.UIFigure);
            app.Panel_2.Title = '预处理前整理';
            app.Panel_2.Position = [8 334 373 207];

            % Create Label_8
            app.Label_8 = uilabel(app.Panel_2);
            app.Label_8.HorizontalAlignment = 'right';
            app.Label_8.Position = [8 148 53 22];
            app.Label_8.Text = '工作路径';

            % Create EditField_7
            app.EditField_7 = uieditfield(app.Panel_2, 'text');
            app.EditField_7.Position = [76 148 243 22];

            % Create Button_9
            app.Button_9 = uibutton(app.Panel_2, 'push');
            app.Button_9.ButtonPushedFcn = createCallbackFcn(app, @Button_9Pushed, true);
            app.Button_9.Position = [328 148 35 22];
            app.Button_9.Text = '...';

            % Create TITIEditFieldLabel
            app.TITIEditFieldLabel = uilabel(app.Panel_2);
            app.TITIEditFieldLabel.HorizontalAlignment = 'right';
            app.TITIEditFieldLabel.Position = [7 115 192 22];
            app.TITIEditFieldLabel.Text = '被试文件夹名称（如001TI则填TI）';

            % Create TITIEditField
            app.TITIEditField = uieditfield(app.Panel_2, 'text');
            app.TITIEditField.Position = [205 115 114 22];

            % Create IMALabel
            app.IMALabel = uilabel(app.Panel_2);
            app.IMALabel.HorizontalAlignment = 'right';
            app.IMALabel.Position = [7 85 183 22];
            app.IMALabel.Text = '需要提取IMA图像所在文件夹名称';

            % Create IMAEditField
            app.IMAEditField = uieditfield(app.Panel_2, 'text');
            app.IMAEditField.Position = [205 85 114 22];

            % Create Label_9
            app.Label_9 = uilabel(app.Panel_2);
            app.Label_9.HorizontalAlignment = 'right';
            app.Label_9.Position = [6 49 53 22];
            app.Label_9.Text = '输出路径';

            % Create EditField_8
            app.EditField_8 = uieditfield(app.Panel_2, 'text');
            app.EditField_8.Position = [74 49 245 22];

            % Create Button_10
            app.Button_10 = uibutton(app.Panel_2, 'push');
            app.Button_10.ButtonPushedFcn = createCallbackFcn(app, @Button_10Pushed, true);
            app.Button_10.Position = [328 49 35 22];
            app.Button_10.Text = '...';

            % Create Button_re
            app.Button_re = uibutton(app.Panel_2, 'push');
            app.Button_re.ButtonPushedFcn = createCallbackFcn(app, @Button_rePushed, true);
            app.Button_re.Position = [22 9 98 24];
            app.Button_re.Text = '批量改名';

            % Create Button_11
            app.Button_11 = uibutton(app.Panel_2, 'push');
            app.Button_11.ButtonPushedFcn = createCallbackFcn(app, @Button_11Pushed, true);
            app.Button_11.Position = [265 9 98 24];
            app.Button_11.Text = '开始整理';

            % Create Panel_3
            app.Panel_3 = uipanel(app.UIFigure);
            app.Panel_3.Title = '预处理后结果分类';
            app.Panel_3.Position = [390 10 286 531];

            % Create Label_10
            app.Label_10 = uilabel(app.Panel_3);
            app.Label_10.HorizontalAlignment = 'right';
            app.Label_10.Position = [13 472 53 22];
            app.Label_10.Text = '工作路径';

            % Create EditField_9
            app.EditField_9 = uieditfield(app.Panel_3, 'text');
            app.EditField_9.Position = [76 472 157 22];

            % Create Button_12
            app.Button_12 = uibutton(app.Panel_3, 'push');
            app.Button_12.ButtonPushedFcn = createCallbackFcn(app, @Button_12Pushed, true);
            app.Button_12.Position = [241 472 28 22];
            app.Button_12.Text = '...';

            % Create Label_11
            app.Label_11 = uilabel(app.Panel_3);
            app.Label_11.HorizontalAlignment = 'right';
            app.Label_11.Position = [13 44 53 22];
            app.Label_11.Text = '输出路径';

            % Create EditField_10
            app.EditField_10 = uieditfield(app.Panel_3, 'text');
            app.EditField_10.Position = [74 44 157 22];

            % Create Button_15
            app.Button_15 = uibutton(app.Panel_3, 'push');
            app.Button_15.ButtonPushedFcn = createCallbackFcn(app, @Button_15Pushed, true);
            app.Button_15.Position = [239 44 32 22];
            app.Button_15.Text = '...';

            % Create Button_16
            app.Button_16 = uibutton(app.Panel_3, 'push');
            app.Button_16.ButtonPushedFcn = createCallbackFcn(app, @Button_16Pushed, true);
            app.Button_16.Position = [171 9 100 24];
            app.Button_16.Text = '开始分类';

            % Create ButtonGroup_4
            app.ButtonGroup_4 = uibuttongroup(app.Panel_3);
            app.ButtonGroup_4.Title = '提取指标(静态)';
            app.ButtonGroup_4.Position = [15 239 253 105];

            % Create FCROIxFCMapCheckBox
            app.FCROIxFCMapCheckBox = uicheckbox(app.ButtonGroup_4);
            app.FCROIxFCMapCheckBox.Text = 'FC(ROIxFCMap)';
            app.FCROIxFCMapCheckBox.Position = [8 53 113 22];

            % Create ReHoCheckBox
            app.ReHoCheckBox = uicheckbox(app.ButtonGroup_4);
            app.ReHoCheckBox.Text = 'ReHo';
            app.ReHoCheckBox.Position = [120 53 53 22];

            % Create ALFFCheckBox
            app.ALFFCheckBox = uicheckbox(app.ButtonGroup_4);
            app.ALFFCheckBox.Text = 'ALFF';
            app.ALFFCheckBox.Position = [171 53 51 22];

            % Create fALFFCheckBox
            app.fALFFCheckBox = uicheckbox(app.ButtonGroup_4);
            app.fALFFCheckBox.Text = 'fALFF';
            app.fALFFCheckBox.Position = [9 15 55 22];

            % Create ROISignalsCheckBox
            app.ROISignalsCheckBox = uicheckbox(app.ButtonGroup_4);
            app.ROISignalsCheckBox.Text = 'ROISignals';
            app.ROISignalsCheckBox.Position = [63 15 83 22];

            % Create FisherZCheckBox
            app.FisherZCheckBox = uicheckbox(app.ButtonGroup_4);
            app.FisherZCheckBox.Text = 'FisherZ';
            app.FisherZCheckBox.Position = [147 15 62 22];

            % Create ButtonGroup_5
            app.ButtonGroup_5 = uibuttongroup(app.Panel_3);
            app.ButtonGroup_5.Title = '提取指标(动态)';
            app.ButtonGroup_5.Position = [15 116 253 117];

            % Create FCCheckBox
            app.FCCheckBox = uicheckbox(app.ButtonGroup_5);
            app.FCCheckBox.Text = 'FC';
            app.FCCheckBox.Position = [8 65 38 22];

            % Create ReHoCheckBox_2
            app.ReHoCheckBox_2 = uicheckbox(app.ButtonGroup_5);
            app.ReHoCheckBox_2.Text = 'ReHo';
            app.ReHoCheckBox_2.Position = [66 65 53 22];

            % Create ALFFCheckBox_2
            app.ALFFCheckBox_2 = uicheckbox(app.ButtonGroup_5);
            app.ALFFCheckBox_2.Text = 'ALFF';
            app.ALFFCheckBox_2.Position = [67 27 51 22];

            % Create fALFFCheckBox_2
            app.fALFFCheckBox_2 = uicheckbox(app.ButtonGroup_5);
            app.fALFFCheckBox_2.Text = 'fALFF';
            app.fALFFCheckBox_2.Position = [8 27 55 22];

            % Create Label_12
            app.Label_12 = uilabel(app.Panel_3);
            app.Label_12.HorizontalAlignment = 'right';
            app.Label_12.Position = [12 439 190 22];
            app.Label_12.Text = '提取文件处理方式（如ARCWSF）';

            % Create ARCWSFEditField
            app.ARCWSFEditField = uieditfield(app.Panel_3, 'text');
            app.ARCWSFEditField.Position = [199 439 69 22];

            % Create zLabel
            app.zLabel = uilabel(app.Panel_3);
            %app.zLabel.WordWrap = 'on';
            app.zLabel.Position = [38 72 208 43];
            app.zLabel.Text = '注：指标默认提取z标准化后的文件';

            % Create ButtonGroup_3
            app.ButtonGroup_3 = uibuttongroup(app.Panel_3);
            app.ButtonGroup_3.SelectionChangedFcn = createCallbackFcn(app, @ButtonGroup3SelectionChanged2, true);
            app.ButtonGroup_3.Title = '平滑';
            app.ButtonGroup_3.Position = [13 350 159 67];

            % Create resultsButton
            app.resultsButton = uiradiobutton(app.ButtonGroup_3);
            app.resultsButton.Text = 'results';
            app.resultsButton.Position = [9 19 58 22];
            app.resultsButton.Value = true;

            % Create resultsSButton
            app.resultsSButton = uiradiobutton(app.ButtonGroup_3);
            app.resultsSButton.Text = 'resultsS';
            app.resultsSButton.Position = [83 19 65 22];

            % Create ButtonGroup_6
            app.ButtonGroup_6 = uibuttongroup(app.Panel_3);
            app.ButtonGroup_6.Position = [148 116 119 95];

            % Create CVButton
            app.CVButton = uiradiobutton(app.ButtonGroup_6);
            app.CVButton.Text = 'CV';
            app.CVButton.Position = [11 68 58 22];
            app.CVButton.Value = true;

            % Create MeanButton
            app.MeanButton = uiradiobutton(app.ButtonGroup_6);
            app.MeanButton.Text = 'Mean';
            app.MeanButton.Position = [11 46 65 22];

            % Create StdButton
            app.StdButton = uiradiobutton(app.ButtonGroup_6);
            app.StdButton.Text = 'Std';
            app.StdButton.Position = [11 24 65 22];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
            % 获取屏幕的尺寸
            screenSize = get(0, 'ScreenSize');
            screenWidth = screenSize(3);
            screenHeight = screenSize(4);
        
            % 获取UIFigure的当前尺寸
            figureSize = app.UIFigure.Position;
            figureWidth = figureSize(3);
            figureHeight = figureSize(4);

            % 计算居中位置
            newLeft = (screenWidth - figureWidth) / 2;
            newTop = (screenHeight - figureHeight) / 2;
        
            % 设置UIFigure的位置使其居中
            app.UIFigure.Position = [newLeft newTop figureWidth figureHeight];
        end
    end
      
    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Better

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end