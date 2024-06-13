#!/bin/bash

STUDENT_FILE="students-list_0524.txt"
EMAIL_FILE="student-emails.txt"
BACKUP_FILE="students-list_0524_backup.txt"

create_student() {
    echo "Enter student email:"
    read email
    echo "Enter student age:"
    read age
    echo "Enter student ID:"
    read id
    echo "$email, $age, $id" >> $STUDENT_FILE
    echo "Student record created."
}

view_students() {
    if [ -f $STUDENT_FILE ]; then
        cat $STUDENT_FILE
    else
        echo "No student records found."
    fi
}

view_emails() {
    if [ -f $STUDENT_FILE ]; then
        awk -F', ' '{print $1}' $STUDENT_FILE | sort
    else
        echo "No student records found."
    fi
}

delete_student() {
    echo "Enter student ID to delete:"
    read id
    if [ -f $STUDENT_FILE ]; then
        grep -v ", $id" $STUDENT_FILE > temp.txt && mv temp.txt $STUDENT_FILE
        echo "Student record deleted."
    else
        echo "No student records found."
    fi
}

update_student() {
    echo "Enter student ID to update:"
    read id
    if [ -f $STUDENT_FILE ]; then
        grep -v ", $id" $STUDENT_FILE > temp.txt
        mv temp.txt $STUDENT_FILE
        echo "Enter new email:"
        read new_email
        echo "Enter new age:"
        read new_age
        echo "$new_email, $new_age, $id" >> $STUDENT_FILE
        echo "Student record updated."
    else
        echo "No student records found."
    fi
}

backup_data() {
    cp $STUDENT_FILE $BACKUP_FILE
    echo "Backup created at $BACKUP_FILE."
}

save_sorted_emails() {
    if [ -f $STUDENT_FILE ]; then
        awk -F', ' '{print $1}' $STUDENT_FILE | sort > $EMAIL_FILE
        echo "Student emails saved in ascending order to $EMAIL_FILE."
    else
        echo "No student records found."
    fi
}

while true; do
    echo "1. Create Student Record"
    echo "2. View All Students"
    echo "3. Delete Student Record"
    echo "4. Update Student Record"
    echo "5. View All Emails in ASC Order"
    echo "6. Backup Data"
    echo "7. Save Student Emails Sorted in ASC"
    echo "8. Exit"
    read choice
    case $choice in
        1) create_student ;;
        2) view_students ;;
        3) delete_student ;;
        4) update_student ;;
        5) view_emails ;;
        6) backup_data ;;
        7) save_sorted_emails ;;
        8)
            echo "Thank you for choosing ALU Education."
            exit 0
            ;;
        *) echo "Invalid option." ;;
    esac
    echo "Press 1 to Exit, or any other number to continue:"
    read continue_choice
    if [ "$continue_choice" -eq 1 ]; then
        echo "Thank you for choosing ALU Education."
        exit 0
    fi
done

