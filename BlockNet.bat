@Echo Off
SetLocal

:begin

echo:
echo ****** 禁止文件夹联网 ******
echo:

set /p folder=请输入文件夹（退出请直接关闭窗口）： 
If Not Exist "%folder%\" Exit/B
If /I "%CD%" NEq "%folder%" PushD %folder%
Set "Cmnd=netsh advfirewall firewall add rule action=block"
echo:
For /R %%a In (*.exe) Do (For %%b In (in out) Do (
      echo 创建禁止 %%b 规则【%%a】
      %Cmnd% name="blocked %%a via script" dir=%%b program="%%a"))

echo:
echo 搞定了，%folder% 中所有 exe 文件的禁止入站、出站规则都已成功创建！
echo ----------------------------
echo:

goto begin

作者：数据分析
链接：https://zhuanlan.zhihu.com/p/590105624
来源：知乎
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。