FROM centos:centos7

COPY ./init.sh /home
COPY ./build.sh /home
COPY ./start.sh /home
COPY ./soft /home/soft

# centos environment init
RUN sh /home/init.sh

# soft build => /home
RUN sh /home/build.sh
 
RUN chmod +x /home/start.sh
# shell格式执行容器启动命令，命令必须无限执行，否则容器启动后马上退出

ENTRYPOINT /home/start.sh && tail -f /dev/null
