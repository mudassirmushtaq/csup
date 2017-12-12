#!/bin/bash

function cleanup {
    rm -rf build
    rm *.spec
}

# Build the MacOS Binary
echo 'Generating the MacOS Binary...'
pyinstaller                                       \
    --noconfirm                                   \
    --onefile                                     \
    --log-level=WARN                              \
    --clean                                       \
    --name csup.macos.x86_64                      \
    csup/__init__.py
cleanup

# Build the Linux Binary
echo 'Generating the Linux Binary...'
docker run -v ${PWD}:/src six8/pyinstaller-alpine \
    --noconfirm                                   \
    --onefile                                     \
    --log-level=WARN                              \
    --clean                                       \
    --name csup.linux.x86_64                      \
    csup/__init__.py
cleanup