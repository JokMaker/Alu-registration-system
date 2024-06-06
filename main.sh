#!/bin/bash

FILENAME="students-list_1023.txt"

# Function to create a student record
create_student() {
  read -p "j.kur@alustudent.com: " email
  read -p "21: " age
  read -p "251200431: " student_id
  echo "$student_id,$email,$age" >> $FILENAME
  echo "Student record created."

  read -p "a.garang@alustudent.com: " email
  read -p "23: " age
  read -p "251200432: " student_id
  echo "$student_id,$email,$age" >> $FILENAME
  echo "Student record created."

  read -p "i.nangah@alustudent.com: " email
  read -p "20: " age
  read -p "251200433: " student_id
  echo "$student_id,$email,$age" >> $FILENAME
  echo "Student record created."
}

# Function to view all student records
view_students() {
  if [ -f $FILENAME ]; then
    cat $FILENAME
  else
    echo "No student records found."
  fi
}

# Function to delete a student record by student ID
delete_student() {
  read -p "251200431: " student_id
  if [ -f $FILENAME ]; then
    grep -v "^$student_id," $FILENAME > temp.txt && mv temp.txt $FILENAME
    echo "Student record deleted."
  else
    echo "No student records found."
  fi
}

# Function to update a student record by student ID
update_student() {
  read -p "251200433: " student_id
  if grep -q "^$student_id," $FILENAME; then
    grep -v "^$student_id," $FILENAME > temp.txt && mv temp.txt $FILENAME
    read -p "i.nangah@alustudent.com: " email
    read -p "21: " age
    echo "$student_id,$email,$age" >> $FILENAME
    echo "Student record updated."
  else
    echo "Student ID not found."
  fi
}

# Main menu
while true; do
  echo "1. Create student record"
  echo "2. View all students"
  echo "3. Delete student record"
  echo "4. Update student record"
  echo "5. Exit"
  read -p "Choose an option: " choice

  case $choice in
    1) create_student ;;
    2) view_students ;;
    3) delete_student ;;
    4) update_student ;;
    5) exit 0 ;;
    *) echo "Invalid option. Please try again." ;;
  esac
done

