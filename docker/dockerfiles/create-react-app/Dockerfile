FROM node
MAINTAINER zhongwei99@163.com
RUN git clone -q https://github.com/facebookincubator/create-react-app.git
WORKDIR create-react-app 
RUN npm install > /dev/null
EXPOSE 3000
ADD startup /opt
RUN chmod a+x /opt/startup
CMD ["/opt/startup"]

