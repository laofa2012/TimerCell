# TimerCellDemo

一个简易的倒计时列表<br>  
每一行根据不同结束时间，进行间隔一秒的倒计时<br>

<img src="https://github.com/laofa2012/TimerCell/blob/master/ReadMeResource/timer_cell_guide.png" width="375" alt="截图" />

## 代码思路：

1. 启动一个定时器，每隔一秒发送一次通知；
2. 每个单元格监听这样的通知，根据各自的设定刷新剩余时间；

