
% Author: 巴山 (bashan)
% Email: moveon5@163.com
% QQ Group: 531421022 (MATLAB编程爱好者)

% Welcome to subscribe matlabaihaozhe (WeChat) and join our QQ group.
% 欢迎关注matlab爱好者微信公众号和加入QQ群.
% Please feel free to contact me if you have any questions.
% 程序使用过程中如遇问题请随时联系作者！

clc;clear;close all;
global fig plt ax txt;
x = 1:0.5:20;
y1 = exp(sin(x)+cos(x));
y2 = sin(x)+cos(x);
y3 = sin(cos(x));
fig = figure;
plt = plot(x,y1,x,y2,x,y3);
xlabel('X Axis');
ylabel('Y Axis');
txt = title('plotHub TEST');
ax = gca;