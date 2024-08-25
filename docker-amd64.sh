export VERSION=${VERSION:-$(git describe --tags --first-parent --abbrev=7 --long --dirty --always | sed -e "s/^v//g")}
export GOFLAGS="'-ldflags=-w -s \"-X=github.com/ollama/ollama/version.Version=$VERSION\" \"-X=github.com/ollama/ollama/server.mode=release\"'"

DOCKER_ORG=${DOCKER_ORG:-"siegrainwong"}
RELEASE_IMAGE_REPO=${RELEASE_IMAGE_REPO:-"${DOCKER_ORG}/release"}
FINAL_IMAGE_REPO=${FINAL_IMAGE_REPO:-"${DOCKER_ORG}/ollama"}

# docker build \
#     --load \
#     --platform=linux/amd64 \
#     --build-arg=VERSION \
#     --build-arg=GOFLAGS \
#     --target runtime-rocm \
#     -f Dockerfile \
#     -t ${RELEASE_IMAGE_REPO}:$VERSION-rocm \
    .

docker build \
    --load \
    --platform=linux/amd64 \
    --build-arg=VERSION \
    --build-arg=GOFLAGS \
    -f Dockerfile \
    -t ${RELEASE_IMAGE_REPO}:$VERSION-amd64 \
    .