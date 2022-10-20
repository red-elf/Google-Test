#!/bin/bash

echo "Preparing the Google Test for the installation" && \
  git submodule init && git submodule update && \
  echo "The Google Test is prepared for the installation"