#!/bin/sh

PROJECT_DIR="/var/www/investplusplus"
CLEAR_SH="/var/www/clear.sh"
BACKUP_DIR="/tmp/laravel-backup"

# Check if the project directory is empty
if [ -z "$(ls -A $PROJECT_DIR)" ]; then
    echo "Project directory is empty. Copying Laravel files..."

    # If the backup exists, copy from the backup
    if [ -d "$BACKUP_DIR" ] && [ "$(ls -A $BACKUP_DIR)" ]; then
        echo "Restoring files from backup..."
        cp -a "$BACKUP_DIR/." "$PROJECT_DIR/"
        rm -rf $BACKUP_DIR
        chmod +x "$CLEAR_SH"
        mv "$CLEAR_SH" "$PROJECT_DIR/"
    else
        echo "No backup available. Run the container once without mounted volume."
        exit 1
    fi
else
    echo "Project directory already contains files. Continuing normally..."
fi

# Set permissions
chmod -R 775 "$PROJECT_DIR/storage"
chmod -R 775 "$PROJECT_DIR/bootstrap/cache"
chmod -R 775 "$PROJECT_DIR/database"

chown -R laravel:laravel "$PROJECT_DIR"

chown -R www-data:www-data "$PROJECT_DIR/storage"
chown -R www-data:www-data "$PROJECT_DIR/bootstrap/cache"
chown -R www-data:www-data "$PROJECT_DIR/database"

echo "Script executed successfully"

exec "$@"