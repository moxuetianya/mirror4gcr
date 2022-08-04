# 1. 多阶段构建,构建特定阶段的镜像
# docker build --target builder -t redis/my.1.0 .
# 2. 构建最小依赖
docker build -t redis/my.7.0 .
