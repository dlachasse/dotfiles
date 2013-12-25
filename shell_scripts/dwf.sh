#!/bin/sh -x
# git name-rev is fail
CURRENT=`git branch | grep '\*' | awk '{print $2}'`
git checkout master
git branch -d ${CURRENT}