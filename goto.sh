#!/bin/bash

SRCDIR=./rblr-embassy-talk-code

pushd $SRCDIR &>/dev/null
git checkout $1 &>/dev/null
nvim --server $NVIM_SOCK --remote-send ":e $SRCDIR/$2<CR>$3gg<CR>"
popd &>/dev/null
