# !/bin/sh

for i in "ubuntu:bionic" "debian:buster-slim"; do
  echo "[MAMBO - Docker] Prepare Dockerfile for $i"
  echo "FROM arm64v8/$i" > Dockerfile
  echo "RUN apt update && apt install -y make gcc libelf-dev ruby" >> Dockerfile

  img="11384eb/mambo:64-$(echo "$i" | cut -d':' -f2 | cut -d'-' -f1)"

  echo "[MAMBO - Docker] Build image $img"
  docker build -t "$img" .
  docker push "$img"
done
