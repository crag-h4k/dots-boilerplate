REPO_DOTS=("tfswitch.toml")
BACKUP_DIR="$(pwd)/backups"
# Make backups
# Create (overwrite) symlinks
for DOT in "${REPO_DOTS[@]}"; do
    SRC_DOT="$(pwd)/$DOT"
    DEST_DOT="$HOME/.$DOT"
    if test -e $DEST_DOT; then
        echo "Backing up $DEST_DOT to $BACKUP_DIR"
        cp -r $DEST_DOT $BACKUP_DIR/.
    fi

    ln -sf $(pwd)/$dot $HOME/.$dot

    if test -e $DEST_DOT; then
        echo "Set symlink for $DOT to $DEST_DOT"
    else
        echo "ERROR: setting symlink for $DOT to $DEST_DOT"
    fi
done
