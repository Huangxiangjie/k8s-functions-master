FROM springci/graalvm-ce:stable-java11-0.10.x
# 对外端口
EXPOSE 8080
# 创建一个可以从本地主机或其他容器挂载的挂载点，一般用来存放数据库和需要保持的数据等
# VOLUME 指定了临时文件目录为/tmp。
# 其效果是在主机 /var/lib/docker 目录下创建了一个临时文件，并链接到容器的/tmp
VOLUME /tmp
# 将jar包添加到容器中并更名为 testDemo.jar.我们在base(项目入口)的pom.xml中指定了打包后的jar名
COPY target/k8s-functions.jar k8s-functions.jar
# 运行jar包
RUN bash -c 'touch /k8s-functions.jar'
# 指定容器启动程序及参数
ENTRYPOINT ["java","-jar","/k8s-functions.jar"]