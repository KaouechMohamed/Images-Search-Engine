#!/bin/bash

# Variables
VOLUME_NAME="images-search-engine_es_data"
BACKUP_FILE="es_data_backup_$(date +%F).tgz"

# Create a temporary container to access the volume data
docker run --rm \
  -v ${VOLUME_NAME}:/backup_volume \
  -v $(pwd):/backup_output \
  alpine \
  sh -c "tar -czf /backup_output/${BACKUP_FILE} -C /backup_volume ."

# Check if the backup was created successfully
if [[ -f "${BACKUP_FILE}" ]]; then
  echo "Backup successfully created: ${BACKUP_FILE}"
else
  echo "Backup failed."
fi
