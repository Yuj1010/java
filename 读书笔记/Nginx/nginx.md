## nginx简介
- Nginx执行过程
  Nginx执行之后会有两种方式，一种是前台运行，一种是后台运行。后台运行进程会有一个master进程和多
  个工作进程，我们可以手动的关掉deamon模式；前台运行，之后有一个单进程，一般这样方式在调试状态使用，
  Nginx是多线程的方式，也是默认的方式。
  一个master进程用来管理worker的，接收外来信号，向各个worker发送信号的。监控运行状态。如果worker
  出现异常，那么久自动重新的启动新的worker进程，基本网络事件，，放在worker中处理，每个worker是互
  等的，一个任务只能在一个worker中处理，worker的进程数量是可以设置的，一般为CPU的核数一致

  Nginx启动之后，master用来管理worker的，所以只需要对master进行操作，就可以了，master会受到外面来的
  消息，在根据信号，做不同的事情，只需要和master通信就可以了。

  nginx 在 0.8 版本之后，引入了一系列命令行参数，来方便我们管理。比如，./nginx -s reload，就是来
  重启 nginx，./nginx -s stop，就是来停止 nginx 的运行。如


## 长链接
	长链接就是在http请求在某个TCP协议之上，当客户端发起请求前，需要先与服务器建立TCP链接，每一次链接又是三次握手
	老确定的，如果客户端与服务端之间网路差一点，这三次交互消费的时间就hi比较多，而且三次也会有网络流量，断开
	也会有四次交互。如果我们可以在一个链接上执行多个请求，那么这个就是所谓的长链接。前提是我们知道请求头和相应提的长度
	
	请求是有body的，如post请求，那么Nginx就需要客户端在请求是执行content-length来声明body的大小，否则就是404，请求体的长度是
	确定的
	
	对于http1.0协议，如果有content-length，那么就接收接收就停止了， 如果没有，就会一直接收，直到断开连接。


