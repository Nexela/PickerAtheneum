echo "Creating or Updating Symlinks in ${FACTORIO_MODS_FOLDER}"

# Run from PickerAtheneum
# .publish/install_symlinks.sh

for FILE in $(find $(pwd)/../ -iname 'info.json' -type f)
do
    MODNAME=$(jq -r .name ${FILE})
    MODVER=$(jq -r .version ${FILE})
    rm -f ${FACTORIO_MODS_FOLDER}/${MODNAME}_*
    ln -s $(dirname ${FILE}) ${FACTORIO_MODS_FOLDER}/${MODNAME}_${MODVER}
done
