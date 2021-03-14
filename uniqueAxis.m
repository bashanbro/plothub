function uniqueAxis(hAxis)

% Author: 巴山 (bashan)
% Email: moveon5@163.com
% QQ Group: 531421022 (MATLAB编程爱好者)

% Welcome to subscribe matlabaihaozhe (WeChat) and join our QQ group.
% 欢迎关注matlab爱好者微信公众号和加入QQ群.
% Please feel free to contact me if you have any questions.
% 程序使用过程中如遇问题请随时联系作者！

len = length(hAxis);
axName = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'};
axnum = cell(1,8);
if len >= 3
    for m = 1:8
        tmploc = [];
        for k = 1:len-1
            xloc = get(hAxis(k),'XAxisLocation');
            yloc = get(hAxis(k),'YAxisLocation');
            xlim = get(hAxis(k),'XLim');
            ylim = get(hAxis(k),'YLim');
            xt = get(hAxis(k),'XTick');
            xtlab = get(hAxis(k),'XTickLabel');
            yt = get(hAxis(k),'YTick');
            ytlab = get(hAxis(k),'YTickLabel');
            xmtv = hAxis(k).XAxis.MinorTickValues;
            ymtv = hAxis(k).YAxis.MinorTickValues;
            xmt = get(hAxis(k),'XMinorTick');
            ymt = get(hAxis(k),'YMinorTick');
            xc = get(hAxis(k),'XColor');
            yc = get(hAxis(k),'YColor');
            switch axName{m}
                case 'bottomMajor'
                    con1 = isequal(xloc,'bottom') && isequal(yloc,'left');
                    con2 = ~isempty(yt) && isequal(sum(ylim),1) && ~isempty(ytlab);
                    con3 = isequal(ymt,'on');
                    con4 = isequal(yc,'none');
                    con5 = isempty(xmtv);
                    if con1 && con2 && con3 && con4 && con5
                        tmploc = [tmploc k];
                    end
                case 'bottomMinor'
                    con1 = isequal(xloc,'bottom') && isequal(yloc,'left');
                    con2 = isempty(yt) && isequal(sum(ylim),0) && isempty(ytlab);
                    con3 = isequal(ymt,'off');
                    con4 = isequal(yc,'none');
                    con5 = ~isempty(xmtv);
                    if con1 && con2 && con3 && con4 && con5
                        tmploc = [tmploc k];
                    end
                case 'topMajor'
                    con1 = isequal(xloc,'top') && isequal(yloc,'left');
                    con2 = ~isempty(yt) && isequal(sum(ylim),1) && ~isempty(ytlab);
                    con3 = isequal(ymt,'on');
                    con4 = isequal(yc,'none');
                    con5 = isempty(xmtv);
                    if con1 && con2 && con3 && con4 && con5
                        tmploc = [tmploc k];
                    end
                case 'topMinor'
                    con1 = isequal(xloc,'top') && isequal(yloc,'left');
                con2 = isempty(yt) && isequal(sum(ylim),0) && isempty(ytlab);
                con3 = isequal(ymt,'off');
                con4 = isequal(yc,'none');
                con5 = ~isempty(xmtv);
                if con1 && con2 && con3 && con4 && con5
                    tmploc = [tmploc k];
                end
                case 'leftMajor'
                    con1 = isequal(xloc,'bottom') && isequal(yloc,'left');
                    con2 = ~isempty(xt) && isequal(sum(xlim),1) && ~isempty(xtlab);
                    con3 = isequal(xmt,'on');
                    con4 = isequal(xc,'none');
                    con5 = isempty(ymtv);
                    if con1 && con2 && con3 && con4 && con5
                        tmploc = [tmploc k];
                    end
                case 'leftMinor'
                    con1 = isequal(xloc,'bottom') && isequal(yloc,'left');
                    con2 = isempty(xt) && isequal(sum(xlim),0) && isempty(xtlab);
                    con3 = isequal(xmt,'off');
                    con4 = isequal(xc,'none');
                    con5 = ~isempty(ymtv);
                    if con1 && con2 && con3 && con4 && con5
                        tmploc = [tmploc k];
                    end
                case 'rightMajor'
                    con1 = isequal(xloc,'bottom') && isequal(yloc,'right');
                    con2 = ~isempty(xt) && isequal(sum(xlim),1) && ~isempty(xtlab);
                    con3 = isequal(xmt,'on');
                    con4 = isequal(xc,'none');
                    con5 = isempty(ymtv);
                    if con1 && con2 && con3 && con4 && con5
                        tmploc = [tmploc k];
                    end
                case 'rightMinor'
                    con1 = isequal(xloc,'bottom') && isequal(yloc,'right');
                    con2 = isempty(xt) && isequal(sum(xlim),0) && isempty(xtlab);
                    con3 = isequal(xmt,'off');
                    con4 = isequal(xc,'none');
                    con5 = ~isempty(ymtv);
                    if con1 && con2 && con3 && con4 && con5
                        tmploc = [tmploc k];
                    end
            end
        end
        axnum{m} = tmploc;
    end
end
for nm = 1:8
    if ~isempty(axnum{nm})
        len = length(axnum{nm});
        if len > 1
            nloc = axnum{nm};
           for nn = 1:len-1
               delete(hAxis(nloc(nn)));
           end
        end
    end
end