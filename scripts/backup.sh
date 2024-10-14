#!/bin/bash

timestamp=$(date '+%Y%m%d_%H%M%S')
function create_backup() {
	zip -r backup_$timestamp.zip /root/DevOps/scripts/ 
}

create_backup
