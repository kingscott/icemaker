#!/bin/bash

# Save our variables
folder_to_archive=$1;
bucket=$2;

# Check if aws command exists
if ! command -v aws; then
    echo "`aws` was not found, please install awscli to continue."
    exit
fi

# # Check if zip exists
if ! command -v zip; then
    echo "`zip` was not found, please install zip."
    exit
fi

# Check if there is a first argument
if [ -z "${folder_to_archive}" ]; then
    echo "Please pass a folder you like to archive.";
    exit;
fi

# Check if folder exists
if [[ ! -d "${folder_to_archive}" ]]; then
    echo "Please use a folder that exists, yeaaah thaaanks. $folder_to_archive doesn't exist."
    exit;
fi

# Zip folder
zip_file_name=$(echo $folder_to_archive | sed 's/\///').zip;
zip -r "${zip_file_name}" "${folder_to_archive}"

sleep 1.5;

# run s3 command
echo "Folder chosen for archiving: ${folder_to_archive}"
read -p "Are you sure you'd like to backup this folder? (Y/n) " decision

# Run command
if [[ ${decision} == "y" ]]; then
    sleep 0.5;
    echo "Archiving..."
    sleep 1;
    echo "Running: aws s3 cp ${zip_file_name} s3://${bucket} --storage-class DEEP_ARCHIVE"
    sleep 1;

    aws s3 cp "${zip_file_name}" s3://${bucket} --storage-class DEEP_ARCHIVE
fi
