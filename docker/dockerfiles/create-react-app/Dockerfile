FROM node
MAINTAINER zhongwei99@163.com
RUN npm install -g create-react-app > /dev/null
EXPOSE 3000
ADD startup /opt
RUN chmod a+x /opt/startup
CMD ["/opt/startup"]

