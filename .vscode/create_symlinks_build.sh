echo "Creating or Updating Symlinks in Develop"

# Run from PickerAtheneum
# .publish/install_symlinks.sh

for FILE in $(find $(pwd)/../ -iname 'info.json' -type f)
do
    MODNAME=$(jq -r .name ${FILE})
    rm -f /home/nexela/Develop/Cpp/factorio/mods/${MODNAME}
    ln -s $(dirname ${FILE}) /home/nexela/Develop/Cpp/factorio/mods/${MODNAME}
done
