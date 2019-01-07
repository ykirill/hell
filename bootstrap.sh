#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install python-software-properties
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install cabal-install-2.4 ghc-8.6.3 happy-1.19.5 alex-3.1.7 -y
