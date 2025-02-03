classdef rename < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure       matlab.ui.Figure
        Panel_4        matlab.ui.container.Panel
        Label_14       matlab.ui.control.Label
        number_diy     matlab.ui.control.Spinner
        Label_13       matlab.ui.control.Label
        ButtonGroup_2  matlab.ui.container.ButtonGroup
        number_afa     matlab.ui.control.RadioButton
        number_number  matlab.ui.control.RadioButton
        number_place   matlab.ui.control.DropDown
        Label_12       matlab.ui.control.Label
        new_more_name  matlab.ui.control.EditField
        Label_11       matlab.ui.control.Label
        more_name      matlab.ui.control.CheckBox
        Panel_3        matlab.ui.container.Panel
        delete_name    matlab.ui.control.EditField
        Label_10       matlab.ui.control.Label
        delete_style   matlab.ui.control.DropDown
        Label_9        matlab.ui.control.Label
        Panel_2        matlab.ui.container.Panel
        change_post    matlab.ui.control.EditField
        Label_8        matlab.ui.control.Label
        change_pre     matlab.ui.control.EditField
        Label_7        matlab.ui.control.Label
        Panel          matlab.ui.container.Panel
        Label_6        matlab.ui.control.Label
        insert_diy     matlab.ui.control.Spinner
        Label_5        matlab.ui.control.Label
        insert_place   matlab.ui.control.DropDown
        Label_4        matlab.ui.control.Label
        insert_name    matlab.ui.control.EditField
        Label_3        matlab.ui.control.Label
        outputroad     matlab.ui.control.EditField
        Label_2        matlab.ui.control.Label
        inputroad      matlab.ui.control.EditField
        Label          matlab.ui.control.Label
        ButtonGroup    matlab.ui.container.ButtonGroup
        rule_number    matlab.ui.control.RadioButton
        rule_delete    matlab.ui.control.RadioButton
        rule_change    matlab.ui.control.RadioButton
        rule_insert    matlab.ui.control.RadioButton
        runButton      matlab.ui.control.Button
        outputbutton   matlab.ui.control.Button
        inputbutton    matlab.ui.control.Button
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 560 435];
            app.UIFigure.Name = '改名小工具';

            % Create inputbutton
            app.inputbutton = uibutton(app.UIFigure, 'push');
            app.inputbutton.Position = [513 403 31 23];
            app.inputbutton.Text = '...';

            % Create outputbutton
            app.outputbutton = uibutton(app.UIFigure, 'push');
            app.outputbutton.Position = [513 375 31 23];
            app.outputbutton.Text = '...';

            % Create runButton
            app.runButton = uibutton(app.UIFigure, 'push');
            app.runButton.Position = [444 15 100 23];
            app.runButton.Text = 'run';

            % Create ButtonGroup
            app.ButtonGroup = uibuttongroup(app.UIFigure);
            app.ButtonGroup.Title = '选择规则';
            app.ButtonGroup.Position = [10 310 260 57];

            % Create rule_insert
            app.rule_insert = uiradiobutton(app.ButtonGroup);
            app.rule_insert.Text = '插入';
            app.rule_insert.Position = [11 11 46 22];
            app.rule_insert.Value = true;

            % Create rule_change
            app.rule_change = uiradiobutton(app.ButtonGroup);
            app.rule_change.Text = '替换';
            app.rule_change.Position = [73 11 46 22];

            % Create rule_delete
            app.rule_delete = uiradiobutton(app.ButtonGroup);
            app.rule_delete.Text = '删除';
            app.rule_delete.Position = [136 11 46 22];

            % Create rule_number
            app.rule_number = uiradiobutton(app.ButtonGroup);
            app.rule_number.Text = '编号';
            app.rule_number.Position = [198 11 46 22];

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.HorizontalAlignment = 'right';
            app.Label.Position = [9 403 53 22];
            app.Label.Text = '文件路径';

            % Create inputroad
            app.inputroad = uieditfield(app.UIFigure, 'text');
            app.inputroad.Position = [77 403 428 22];

            % Create Label_2
            app.Label_2 = uilabel(app.UIFigure);
            app.Label_2.HorizontalAlignment = 'right';
            app.Label_2.Position = [9 375 53 22];
            app.Label_2.Text = '输出路径';

            % Create outputroad
            app.outputroad = uieditfield(app.UIFigure, 'text');
            app.outputroad.Position = [77 375 428 22];

            % Create Panel
            app.Panel = uipanel(app.UIFigure);
            app.Panel.Title = '插入';
            app.Panel.Position = [10 172 260 127];

            % Create Label_3
            app.Label_3 = uilabel(app.Panel);
            app.Label_3.HorizontalAlignment = 'right';
            app.Label_3.Position = [5 74 53 22];
            app.Label_3.Text = '插入内容';

            % Create insert_name
            app.insert_name = uieditfield(app.Panel, 'text');
            app.insert_name.Position = [73 74 100 22];

            % Create Label_4
            app.Label_4 = uilabel(app.Panel);
            app.Label_4.HorizontalAlignment = 'right';
            app.Label_4.Position = [5 41 53 22];
            app.Label_4.Text = '插入位置';

            % Create insert_place
            app.insert_place = uidropdown(app.Panel);
            app.insert_place.Items = {'开头', '末尾', '自定义'};
            app.insert_place.Position = [73 41 100 22];
            app.insert_place.Value = '开头';

            % Create Label_5
            app.Label_5 = uilabel(app.Panel);
            app.Label_5.HorizontalAlignment = 'right';
            app.Label_5.Position = [5 5 92 22];
            app.Label_5.Text = '自定义 插入到第';

            % Create insert_diy
            app.insert_diy = uispinner(app.Panel);
            app.insert_diy.Position = [112 5 100 22];

            % Create Label_6
            app.Label_6 = uilabel(app.Panel);
            app.Label_6.HorizontalAlignment = 'right';
            app.Label_6.Position = [211 5 41 22];
            app.Label_6.Text = '字符后';

            % Create Panel_2
            app.Panel_2 = uipanel(app.UIFigure);
            app.Panel_2.Title = '替换';
            app.Panel_2.Position = [284 277 260 90];

            % Create Label_7
            app.Label_7 = uilabel(app.Panel_2);
            app.Label_7.HorizontalAlignment = 'right';
            app.Label_7.Position = [13 36 65 22];
            app.Label_7.Text = '替换前内容';

            % Create change_pre
            app.change_pre = uieditfield(app.Panel_2, 'text');
            app.change_pre.Position = [93 36 100 22];

            % Create Label_8
            app.Label_8 = uilabel(app.Panel_2);
            app.Label_8.HorizontalAlignment = 'right';
            app.Label_8.Position = [14 9 65 22];
            app.Label_8.Text = '替换后内容';

            % Create change_post
            app.change_post = uieditfield(app.Panel_2, 'text');
            app.change_post.Position = [94 9 100 22];

            % Create Panel_3
            app.Panel_3 = uipanel(app.UIFigure);
            app.Panel_3.Title = '删除';
            app.Panel_3.Position = [284 172 260 101];

            % Create Label_9
            app.Label_9 = uilabel(app.Panel_3);
            app.Label_9.HorizontalAlignment = 'right';
            app.Label_9.Position = [9 48 53 22];
            app.Label_9.Text = '删除样式';

            % Create delete_style
            app.delete_style = uidropdown(app.Panel_3);
            app.delete_style.Items = {'所有英文字母', '所有中文汉字', '所有数字', '自定义'};
            app.delete_style.Position = [77 48 115 22];
            app.delete_style.Value = '所有英文字母';

            % Create Label_10
            app.Label_10 = uilabel(app.Panel_3);
            app.Label_10.HorizontalAlignment = 'right';
            app.Label_10.Position = [9 15 89 22];
            app.Label_10.Text = '自定义删除内容';

            % Create delete_name
            app.delete_name = uieditfield(app.Panel_3, 'text');
            app.delete_name.Position = [113 15 100 22];

            % Create more_name
            app.more_name = uicheckbox(app.UIFigure);
            app.more_name.Text = '更改拓展名';
            app.more_name.Position = [288 126 82 22];

            % Create Label_11
            app.Label_11 = uilabel(app.UIFigure);
            app.Label_11.HorizontalAlignment = 'right';
            app.Label_11.Position = [376 126 53 22];
            app.Label_11.Text = '新拓展名';

            % Create new_more_name
            app.new_more_name = uieditfield(app.UIFigure, 'text');
            app.new_more_name.Position = [444 126 100 22];

            % Create Panel_4
            app.Panel_4 = uipanel(app.UIFigure);
            app.Panel_4.Title = '编号';
            app.Panel_4.Position = [10 7 260 155];

            % Create Label_12
            app.Label_12 = uilabel(app.Panel_4);
            app.Label_12.HorizontalAlignment = 'right';
            app.Label_12.Position = [8 98 29 22];
            app.Label_12.Text = '位置';

            % Create number_place
            app.number_place = uidropdown(app.Panel_4);
            app.number_place.Items = {'开头', '末尾', '自定义'};
            app.number_place.Position = [52 98 100 22];
            app.number_place.Value = '开头';

            % Create ButtonGroup_2
            app.ButtonGroup_2 = uibuttongroup(app.Panel_4);
            app.ButtonGroup_2.Title = '类型';
            app.ButtonGroup_2.Position = [10 8 123 50];

            % Create number_number
            app.number_number = uiradiobutton(app.ButtonGroup_2);
            app.number_number.Text = '数字';
            app.number_number.Position = [11 4 46 22];
            app.number_number.Value = true;

            % Create number_afa
            app.number_afa = uiradiobutton(app.ButtonGroup_2);
            app.number_afa.Text = '字母';
            app.number_afa.Position = [64 3 46 22];

            % Create Label_13
            app.Label_13 = uilabel(app.Panel_4);
            app.Label_13.HorizontalAlignment = 'right';
            app.Label_13.Position = [8 65 92 22];
            app.Label_13.Text = '自定义 插入到第';

            % Create number_diy
            app.number_diy = uispinner(app.Panel_4);
            app.number_diy.Position = [115 65 100 22];

            % Create Label_14
            app.Label_14 = uilabel(app.Panel_4);
            app.Label_14.Position = [218 65 41 22];
            app.Label_14.Text = '字符后';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = rename

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