#!/bin/bash

# Variables
VOLUME_NAME="images-search-engine_es_data"
BACKUP_FILE="es_data_backup_2024-10-26.tgz"  # Update this with the correct filename

# Create the Docker volume
docker volume create ${VOLUME_NAME}

# Restore the `.tgz` file contents into the volume
docker run --rm \
  -v ${VOLUME_NAME}:/backup_volume \
  -v $(pwd):/backup_source \
  alpine \
  sh -c "tar -xzf /backup_source/${BACKUP_FILE} -C /backup_volume"

echo "Restoration complete for volume: ${VOLUME_NAME}"
