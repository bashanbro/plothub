function axHandle = addAxis(fig,ax,axisLoc)

% Author: 巴山 (bashan)
% Email: moveon5@163.com
% QQ Group: 531421022 (MATLAB编程爱好者)

% Welcome to subscribe matlabaihaozhe (WeChat) and join our QQ group.
% 欢迎关注matlab爱好者微信公众号和加入QQ群.
% Please feel free to contact me if you have any questions.
% 程序使用过程中如遇问题请随时联系作者！

loc = get(ax,'Position');
switch axisLoc
    % 获取坐标轴位置信息
    %% 底部X轴
    case 'bottomMajor'
        % set axis bottom Major
        axbottomMajor = axes(fig,'Position',loc,...
            'XAxisLocation','bottom',...
            'YAxisLocation','left',...
            'Color','none',...
            'XMinorTick','off',...
            'XColor','k','YColor','none');
        axbottomMajor.XLim = ax.XLim;
        axbottomMajor.XTick = ax.XTick;
        axbottomMajor.XTickLabel = ax.XTickLabel;
        axbottomMajor.XAxis.MinorTickValues = [];
        % Decide by Y
        axbottomMajor.YLim = [0 1];
        axbottomMajor.YTick = ax.YTick;
        axbottomMajor.YTickLabel = ax.YTickLabel;
        axbottomMajor.YAxis.MinorTickValues = ax.YAxis.MinorTickValues;
        axbottomMajor.YMinorTick = 'on';
        axHandle = axbottomMajor;
    case 'bottomMinor'
        % set axis bottom Minor
        axbottomMinor = axes(fig,'Position',loc,...
            'XAxisLocation','bottom',...
            'YAxisLocation','left',...
            'Color','none',...
            'XColor','k','YColor','none');
        axbottomMinor.XLim = ax.XLim;
        axbottomMinor.XTick = ax.XTick;
        axbottomMinor.XTickLabel = [];
        set(axbottomMinor,'XTick',[]);
        set(axbottomMinor.XAxis,'MinorTickValues',ax.XAxis.MinorTickValues);
        set(axbottomMinor,'XMinorTick','on');
        % Decide by Y
        axbottomMinor.YLim = [-1 1];
        axbottomMinor.YTick = [];
        axbottomMinor.YTickLabel = [];
        axbottomMinor.YAxis.MinorTickValues = [];
        axbottomMinor.YMinorTick = 'off';
        axHandle = axbottomMinor;
        %% 顶部X轴
    case 'topMajor'
        % set axis top Major
        axtopMajor = axes(fig,'Position',loc,...
            'XAxisLocation','top',...
            'YAxisLocation','left',...
            'Color','none',...
            'XMinorTick','off',...
            'XColor','k','YColor','none');
        axtopMajor.XLim = ax.XLim;
        axtopMajor.XTick = ax.XTick;
        axtopMajor.XTickLabel = ax.XTickLabel;
        axtopMajor.XAxis.MinorTickValues = [];
         % Decide by Y
        axtopMajor.YLim = [0 1];
        axtopMajor.YTick = ax.YTick;
        axtopMajor.YTickLabel = ax.YTickLabel;
        axtopMajor.YAxis.MinorTickValues = ax.YAxis.MinorTickValues;
        axtopMajor.YMinorTick = 'on';
        axHandle = axtopMajor;
    case 'topMinor'
        % set axis top Minor
        axtopMinor = axes(fig,'Position',loc,...
            'XAxisLocation','top',...
            'YAxisLocation','left',...
            'Color','none',...
            'XColor','k','YColor','none');
        axtopMinor.XLim = ax.XLim;
        axtopMinor.XTick = ax.XTick;
        axtopMinor.XTickLabel = [];
        set(axtopMinor,'XTick',[]);
        set(axtopMinor.XAxis,'MinorTickValues',ax.XAxis.MinorTickValues);
        set(axtopMinor,'XMinorTick','on');
        % Decide by Y
        axtopMinor.YLim = [-1 1];
        axtopMinor.YTick = [];
        axtopMinor.YTickLabel = [];
        axtopMinor.YAxis.MinorTickValues = [];
        axtopMinor.YMinorTick = 'off';
        axHandle = axtopMinor;
        %% Left Y
    case 'leftMajor'
        % set axis Left Major
        ayleftMajor = axes(fig,'Position',loc,...
            'XAxisLocation','bottom',...
            'YAxisLocation','left',...
            'Color','none',...
            'YMinorTick','off',...
            'XColor','none','YColor','k');
        ayleftMajor.YLim = ax.YLim;
        ayleftMajor.YTick = ax.YTick;
        ayleftMajor.YTickLabel = ax.YTickLabel;
        ayleftMajor.YAxis.MinorTickValues = [];
        % Decide by X
        ayleftMajor.XLim = [0 1];
        ayleftMajor.XTick = ax.XTick;
        ayleftMajor.XTickLabel = ax.XTickLabel;
        ayleftMajor.XAxis.MinorTickValues = ax.XAxis.MinorTickValues;
        ayleftMajor.XMinorTick = 'on';
        axHandle = ayleftMajor;
    case 'leftMinor'
        % set axis Left Minor
        ayleftMinor = axes(fig,'Position',loc,...
            'XAxisLocation','bottom',...
            'YAxisLocation','left',...
            'Color','none',...
            'XColor','none','YColor','k');
        ayleftMinor.YLim = ax.YLim;
        ayleftMinor.YTick = ax.YTick;
        ayleftMinor.YTickLabel = [];
        set(ayleftMinor,'YTick',[]);
        set(ayleftMinor.YAxis,'MinorTickValues',ax.YAxis.MinorTickValues);
        set(ayleftMinor,'YMinorTick','on');
        % Decide by X
        ayleftMinor.XLim = [-1 1];
        ayleftMinor.XTick = [];
        ayleftMinor.XTickLabel = [];
        ayleftMinor.XAxis.MinorTickValues = [];
        ayleftMinor.XMinorTick = 'off';
        axHandle = ayleftMinor;
        %% Rigth Y
    case 'rightMajor'
        % set axis Right Major
        ayrightMajor = axes(fig,'Position',loc,...
            'XAxisLocation','bottom',...
            'YAxisLocation','right',...
            'Color','none',...
            'YMinorTick','off',...
            'XColor','none','YColor','k');
        ayrightMajor.YLim = ax.YLim;
        ayrightMajor.YTick = ax.YTick;
        ayrightMajor.YTickLabel = ax.YTickLabel;
        ayrightMajor.YAxis.MinorTickValues = [];
        % Decide by X
        ayrightMajor.XLim = [0 1];
        ayrightMajor.XTick = ax.XTick;
        ayrightMajor.XTickLabel = ax.XTickLabel;
        ayrightMajor.XAxis.MinorTickValues = ax.XAxis.MinorTickValues;
        ayrightMajor.XMinorTick = 'on';
        axHandle = ayrightMajor;
    case 'rightMinor'
        % set axis Right Minor
        ayrightMinor = axes(fig,'Position',loc,...
            'XAxisLocation','bottom',...
            'YAxisLocation','right',...
            'Color','none',...
            'XColor','none','YColor','k');
        ayrightMinor.YLim = ax.YLim;
        ayrightMinor.YTick = ax.YTick;
        ayrightMinor.YTickLabel = [];
        set(ayrightMinor,'YTick',[]);
        set(ayrightMinor.YAxis,'MinorTickValues',ax.YAxis.MinorTickValues);
        set(ayrightMinor,'YMinorTick','on');
        % Decide by X
        ayrightMinor.XLim = [-1 1];
        ayrightMinor.XTick = [];
        ayrightMinor.XTickLabel = [];
        ayrightMinor.XAxis.MinorTickValues = [];
        ayrightMinor.XMinorTick = 'off';
        axHandle =  ayrightMinor;
end