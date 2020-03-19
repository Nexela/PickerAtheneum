echo "Creating or Updating Symlinks in /home/nexela/Develop/Cpp/Factorio/mods/"

# Run from PickerAtheneum
# .publish/install_symlinks.sh

for FILE in $(find $(pwd)/../ -iname 'info.json' -type f)
do
    MODNAME=$(jq -r .name ${FILE})
    MODVER=$(jq -r .version ${FILE})
    rm -f /home/nexela/Develop/Cpp/Factorio/mods/${MODNAME}_*
    ln -s $(dirname ${FILE}) /home/nexela/Develop/Cpp/Factorio/mods/${MODNAME}_${MODVER}
done
