#!/bin/bash
export MOJO_PATH=$MOJO_PATH:$(pwd)
pixi run mojo tests/test_main.mojo