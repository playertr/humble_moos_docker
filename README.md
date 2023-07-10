# humble_moos_docker
Dockerfile for ROS 2 Humble and MOOS, including a few other dependencies.

# Building
```
docker build . -t playertr/humble_moos
```

# Pushing to Docker Hub
```
docker push playertr/humble_moos
```

# Cross-compilation build
```
docker buildx build --platform linux/arm64 -t playertr/humble_moos:arm64 --load .
```