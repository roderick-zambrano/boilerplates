# Termux Default Font Change

Functionally, Termux uses the font named "font.ttf" found in the "~/.termux" directory. Overwriting this font with your desired font will display it upon restarting Termux.

The script assumes the usage of `curl` to download the .zip of a font from a URL, but this is only required if the font is not already in the host device. It includes the steps of unzipping the files, selecting the desired .ttf file from the downloaded collection, overwriting the existing font.ttf file, and deleting the unnecessary downloaded fonts to clean everything up.