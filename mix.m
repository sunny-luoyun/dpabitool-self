classdef mix < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure       matlab.ui.Figure
        Button         matlab.ui.control.Button
        EditField      matlab.ui.control.EditField
        Label_5        matlab.ui.control.Label
        EditFieldn2    matlab.ui.control.EditField
        Label_4        matlab.ui.control.Label
        EditField2     matlab.ui.control.EditField
        Label_3        matlab.ui.control.Label
        runButton      matlab.ui.control.Button
        EditFieldn1    matlab.ui.control.EditField
        Label_2        matlab.ui.control.Label
        EditField1     matlab.ui.control.EditField
        X2ButtonGroup  matlab.ui.container.ButtonGroup
        X34Button      matlab.ui.control.RadioButton
        X33Button      matlab.ui.control.RadioButton
        X24Button      matlab.ui.control.RadioButton
        X23Button      matlab.ui.control.RadioButton
        Label          matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: runButton
        function runButtonPushed(app, event)
            if app.X23Button.Value
                x23(app.EditField.Value, app.EditField1.Value, app.EditField2.Value, app.EditFieldn1.Value, app.EditFieldn2.Value)
                %addpath('/Users/sunny/Applications/spm12');
                disp('over!!!!!!!!!!!')
            end
            if app.X24Button.Value
                x24(app.EditField.Value, app.EditField1.Value, app.EditField2.Value, app.EditFieldn1.Value, app.EditFieldn2.Value)
                %addpath('/Users/sunny/Applications/spm12');
                disp('over!!!!!!!!!!!')
            end
            if app.X33Button.Value
                x33(app.EditField.Value, app.EditField1.Value, app.EditField2.Value, app.EditFieldn1.Value, app.EditFieldn2.Value)
                %addpath('/Users/sunny/Applications/spm12');
                disp('over!!!!!!!!!!!')
            end
            if app.X34Button.Value
                x34(app.EditField.Value, app.EditField1.Value, app.EditField2.Value, app.EditFieldn1.Value, app.EditFieldn2.Value)
                %addpath('/Users/sunny/Applications/spm12');
                disp('over!!!!!!!!!!!')
            end
            
            
        end

        % Button pushed function: runButton
        function ButtonPushed(app, event)
            % 弹出文件夹选择对话框
            folderPath = uigetdir();  % 用户选择的文件夹路径
            if isequal(folderPath, 0)
                disp('用户取消了选择');
                figure(app.UIFigure);
            else
                % 将选择的文件夹路径设置到EditField_6中
                app.EditField.Value = folderPath;
                figure(app.UIFigure);
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 376 203];
            app.UIFigure.Name = 'MATLAB App';

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.HorizontalAlignment = 'right';
            app.Label.Position = [5 142 60 22];
            app.Label.Text = '因子1名字';

            % Create X2ButtonGroup
            app.X2ButtonGroup = uibuttongroup(app.UIFigure);
            app.X2ButtonGroup.Title = '因子1 X 因子2';
            app.X2ButtonGroup.Position = [14 7 243 83];

            % Create X23Button
            app.X23Button = uiradiobutton(app.X2ButtonGroup);
            app.X23Button.Text = '2X3';
            app.X23Button.Position = [11 37 43 22];
            app.X23Button.Value = true;

            % Create X24Button
            app.X24Button = uiradiobutton(app.X2ButtonGroup);
            app.X24Button.Text = '2X4';
            app.X24Button.Position = [75 37 43 22];

            % Create X33Button
            app.X33Button = uiradiobutton(app.X2ButtonGroup);
            app.X33Button.Text = '3X3';
            app.X33Button.Position = [125 37 43 22];

            % Create X34Button
            app.X34Button = uiradiobutton(app.X2ButtonGroup);
            app.X34Button.Text = '3X4';
            app.X34Button.Position = [184 37 43 22];

            % Create EditField1
            app.EditField1 = uieditfield(app.UIFigure, 'text');
            app.EditField1.Position = [80 142 100 22];

            % Create Label_2
            app.Label_2 = uilabel(app.UIFigure);
            app.Label_2.HorizontalAlignment = 'right';
            app.Label_2.Position = [191 142 65 22];
            app.Label_2.Text = '各水平名称';

            % Create EditFieldn1
            app.EditFieldn1 = uieditfield(app.UIFigure, 'text');
            app.EditFieldn1.Position = [271 142 100 22];

            % Create runButton
            app.runButton = uibutton(app.UIFigure, 'push');
            app.runButton.ButtonPushedFcn = createCallbackFcn(app, @runButtonPushed, true);
            app.runButton.Position = [272 7 100 23];
            app.runButton.Text = '统计';

            % Create Label_3
            app.Label_3 = uilabel(app.UIFigure);
            app.Label_3.HorizontalAlignment = 'right';
            app.Label_3.Position = [6 111 60 22];
            app.Label_3.Text = '因子2名字';

            % Create EditField2
            app.EditField2 = uieditfield(app.UIFigure, 'text');
            app.EditField2.Position = [81 111 100 22];

            % Create Label_4
            app.Label_4 = uilabel(app.UIFigure);
            app.Label_4.HorizontalAlignment = 'right';
            app.Label_4.Position = [192 111 65 22];
            app.Label_4.Text = '各水平名称';

            % Create EditFieldn2
            app.EditFieldn2 = uieditfield(app.UIFigure, 'text');
            app.EditFieldn2.Position = [272 111 100 22];

            % Create Label_5
            app.Label_5 = uilabel(app.UIFigure);
            app.Label_5.HorizontalAlignment = 'center';
            app.Label_5.Position = [12 172 53 22];
            app.Label_5.Text = '工作目录';

            % Create EditField
            app.EditField = uieditfield(app.UIFigure, 'text');
            app.EditField.Position = [80 172 255 22];

            % Create Button
            app.Button = uibutton(app.UIFigure, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.Position = [343 172 29 23];
            app.Button.Text = '...';

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
        function app = mix

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