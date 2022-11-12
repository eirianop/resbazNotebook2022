function create() { docker run --rm -v $(pwd):/results resbazNotebook2022:latest "$@"; }
