#!/bin/bash

# Function to add a new user
add_user() {
  read -p "Enter the username to add: " username
  if id "$username" &>/dev/null; then
    echo "User $username already exists!"
  else
    sudo useradd "$username"
    sudo passwd "$username"
    echo "User $username has been added successfully."
  fi
}

# Function to modify a user’s information
modify_user() {
  read -p "Enter the username to modify: " username
  if id "$username" &>/dev/null; then
    echo "What would you like to modify?"
    echo "1) Change home directory"
    echo "2) Change shell"
    read -p "Choose an option (1 or 2): " option
    case $option in
      1)
        read -p "Enter the new home directory path: " home_dir
        sudo usermod -d "$home_dir" "$username"
        echo "Home directory for $username has been changed to $home_dir."
        ;;
      2)
        read -p "Enter the new shell path (e.g., /bin/bash): " shell
        sudo usermod -s "$shell" "$username"
        echo "Shell for $username has been changed to $shell."
        ;;
      *)
        echo "Invalid option. Returning to main menu."
        ;;
    esac
  else
    echo "User $username does not exist."
  fi
}

# Function to delete a user
delete_user() {
  read -p "Enter the username to delete: " username
  if id "$username" &>/dev/null; then
    sudo userdel "$username"
    echo "User $username has been deleted successfully."
  else
    echo "User $username does not exist."
  fi
}

# Function to add a new group
add_group() {
  read -p "Enter the group name to add: " groupname
  if getent group "$groupname" &>/dev/null; then
    echo "Group $groupname already exists!"
  else
    sudo groupadd "$groupname"
    echo "Group $groupname has been added successfully."
  fi
}

# Function to add a user to a group
add_user_to_group() {
  read -p "Enter the username to add to a group: " username
  read -p "Enter the group name: " groupname
  if id "$username" &>/dev/null && getent group "$groupname" &>/dev/null; then
    sudo usermod -aG "$groupname" "$username"
    echo "User $username has been added to group $groupname."
  else
    echo "Either the user or group does not exist."
  fi
}

# Function to change file or directory permissions
change_permissions() {
  read -p "Enter the file or directory path: " file_dir
  if [ -e "$file_dir" ]; then
    read -p "Enter the permissions in numeric format (e.g., 755): " permissions
    if [[ "$permissions" =~ ^[0-7]{3}$ ]]; then
      chmod "$permissions" "$file_dir"
      echo "Permissions for $file_dir have been changed to $permissions."
    else
      echo "Invalid permission format. Please use a three-digit numeric format like 755."
    fi
  else
    echo "The file or directory does not exist."
  fi
}

# Main menu loop
while true; do
  echo
  echo "User, Group, and Permission Management Script"
  echo "--------------------------------------------"
  echo "Choose an option:"
  echo "1) Add a new user"
  echo "2) Modify an existing user"
  echo "3) Delete a user"
  echo "4) Add a new group"
  echo "5) Add a user to a group"
  echo "6) Change file or directory permissions"
  echo "7) Exit"
  read -p "Enter your choice [1-7]: " choice

  case $choice in
    1) add_user ;;
    2) modify_user ;;
    3) delete_user ;;
    4) add_group ;;
    5) add_user_to_group ;;
    6) change_permissions ;;
    7) echo "Exiting script. Goodbye!"; exit ;;
    *) echo "Invalid choice. Please select a number between 1 and 7." ;;
  esac
done
