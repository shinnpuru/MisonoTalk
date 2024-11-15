# 使用 Nginx 官方镜像作为基础镜像
FROM nginx:alpine

# 删除默认的 Nginx 网站内容
RUN rm -rf /usr/share/nginx/html/*

# 将构建的 Flutter Web 项目复制到 Nginx 服务器的默认目录
COPY build/web /usr/share/nginx/html

# 暴露 Nginx 的 80 端口
EXPOSE 80

# 启动 Nginx 服务
CMD ["nginx", "-g", "daemon off;"]
