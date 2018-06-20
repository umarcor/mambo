#! /bin/sh

set -e

cd $(dirname $0)

. "../travis/ansi_color.sh"
. "../travis/utils.sh"
#disable_color

echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

for tag in `echo $(docker images aptman/* | awk -F ' ' '{print $1 ":" $2}') | cut -d ' ' -f2-`; do
  if [ "$tag" = "REPOSITORY:TAG" ]; then break; fi
  echo "travis_fold:start:`echo $tag | grep -oP 'ghdl/\K.*'`"
  travis_time_start
    printf "$ANSI_YELLOW[DOCKER push] ${tag}$ANSI_NOCOLOR\n"
    docker push $tag
  travis_time_finish
  echo "travis_fold:end:`echo $tag | grep -oP 'ghdl/\K.*'`"
done

docker logout
