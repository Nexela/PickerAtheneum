#download just this script and run it in your Root Factorio Mod Development Folder
#SET ENV Var FACTORIO_MODS_FOLDER to the path to your Factorio mods folder

git clone git@github.com:Afforess/Factorio-Stdlib.git
#install into mods
git clone git@github.com:nexela/Nanobots.git
#install into mods
mkdir Picker && cd Picker
git clone git@github.com:nexela/PickerAtheneum.git
cd PickerAtheneum
.vscode/get_picker.sh
#Where are we here?
.vscode/create_symlinks.sh
