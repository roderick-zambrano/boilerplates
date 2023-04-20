#!/bin/bash

# Set Default Font

cd && 
cd .termux && 
curl -fLo font.zip [URL pointing to .zip download] && 
mkdir fonts && 
mv font.zip fonts &&
cd fonts && 
unzip font.zip && 
mv "Name of Font.ttf" .. && 
cd .. && 
mv "Name of Font.ttf" font.ttf && 
rm -rf fonts