@Echo Off
SetLocal

:begin

echo:
echo ****** 删除文件夹联网限制 ******
echo:

set /p folder=请输入文件夹（退出请直接关闭窗口）：
If Not Exist "%folder%\" Exit/B
If /I "%CD%" NEq "%folder%" PushD %folder%
Set "Cmnd=netsh advfirewall firewall delete rule"

echo:
For /R %%a In (*.exe) Do (
For %%b In (in out) Do (
echo 正在删除 %%b 规则【%%a】
%Cmnd% name="blocked %%a via script" dir=%%b program="%%a"
)
)

echo:
echo 完成，%folder% 中所有 exe 文件的入站、出站规则都已成功删除！
echo ----------------------------
echo:

goto begin