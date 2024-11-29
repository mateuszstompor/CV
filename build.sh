#!/usr/bin/env bash -e

#
#  Copyright © 2022 Mateusz Stompór. All rights reserved.
#

DIST_DIR=distribution
BUILD_DATE=$(TZ=Europe/Warsaw date +"%m%d%H%M")
AUTHOR_NAME="Mateusz Stompór"
TITLE="CV"
FILE_NAME="${AUTHOR_NAME} - ${TITLE} - ${BUILD_DATE}"

fail() {
  echo $1
  exit 1
}

which pdflatex 2>&1 1>/dev/null || fail "pdflatex is not installed"
mkdir -p ${DIST_DIR} || fail "Could not create output directories"
pdflatex -halt-on-error \
         -jobname="${FILE_NAME}" \
         -output-directory=${DIST_DIR} \
         mateuszstompor.tex 2>&1 1>/dev/null || fail "Could not build the pdf"
