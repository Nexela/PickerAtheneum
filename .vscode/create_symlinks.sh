echo "Creating or Updating Symlinks in ${FACTORIO_MODS_FOLDER}"

# Run from PickerAtheneum
# .publish/install_symlinks.sh

for FILE in $(find $(pwd)/../ -iname 'info.json' -type f)
do
    MODNAME=$(jq -r .name ${FILE})
    rm -f /home/nexela/factorio/mods/${MODNAME}*
    ln -s $(dirname ${FILE}) /home/nexela/factorio/mods/${MODNAME}
done
