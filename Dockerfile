FROM swr.cn-north-4.myhuaweicloud.com/vmall-demo/cse-huawei-jre:8u201

WORKDIR /home/apps/
ENV JRE_HOME=$JAVA_HOME
ENV CLASSPATH=.:${JRE_HOME}/lib \
    PATH=$JRE_HOME/bin:$PATH

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD target/*.jar ./
ADD start.sh . 
  
ENTRYPOINT ["sh", "/home/apps/start.sh"]
