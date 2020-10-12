#git clone git@github.com:nexela/PickerAtheneum.git
cd ../
git submodule update --init --recursive
cd ../
git clone git@github.com:nexela/PickerExtended.git
git clone git@github.com:nexela/PickerTweaks
git clone git@github.com:nexela/PickerDollies
git clone git@github.com:nexela/PickerInventoryTools.git
git clone git@github.com:nexela/PickerBlueprinter.git
git clone git@github.com:nexela/PickerVehicles.git
git clone git@github.com:nexela/PickerBeltTools.git
git clone git@github.com:nexela/PickerPipeTools.git
git clone git@github.com:nexela/PickerFill.git
#git clone git@github.com:nexela/PickerNotes.git
git clone git@github.com:nexela/Nanobots.git
git clone --recurse-submodules git@github.com:Afforess/Factorio-Stdlib.git stdlib
git clone git@github.com:factoriolib/flib.git
ln -s PickerAtheneum/.vscode/linux .vscode
ln -s $(basename $(pwd))/stdlib/luacheckrc/.luacheckrc ../.luacheckrc
ln -s $(basename $(pwd))/stdlib/luacheckrc/.lua-format ../.lua-format
