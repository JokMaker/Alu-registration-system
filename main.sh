#!/bin/bash

STUDENT_FILE="students-list_0524.txt"

create_student() {
    echo "j.kur@alustudent.com:"
    read email
    echo "21:"
    read age
    echo "00012:"
    read id
    echo "$email, $age, $id" >> $STUDENT_FILE
    echo "Student record created."

    echo "a.garang@alustudent.com:"
    read email
    echo "23:"
    read age
    echo "00013:"
    read id
    echo "$email, $age, $id" >> $STUDENT_FILE
    echo "Student record created."

echo "a.kasa@alustudent.com:"
    read email
    echo "25:"
    read age
    echo "00014:"
    read id
    echo "$email, $age, $id" >> $STUDENT_FILE
    echo "Student record created." 

    echo "p.hirwa@alustudent.com:"
    read email
    echo "22:"
    read age
    echo "00015:"
    read id
    echo "$email, $age, $id" >> $STUDENT_FILE
    echo "Student record created."

    echo "i.nangah@alustudent.com:"
    read email
    echo "23:"
    read age
    echo "00016:"
    read id
    echo "$email, $age, $id" >> $STUDENT_FILE
    echo "Student record created." 

    echo "p.savadogo@alustudent.com:"
    read email
    echo "20:"
    read age
    echo "00017:"
    read id
    echo "$email, $age, $id" >> $STUDENT_FILE
    echo "Student record created."

    echo "m.audrey1@alustudent.com:"
    read email
    echo "19:"
    read age
    echo "00012:"
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

delete_student() {
    echo "00012:"
    read id
    if [ -f $STUDENT_FILE ]; then
        grep -v ", $id" $STUDENT_FILE > temp.txt && mv temp.txt $STUDENT_FILE
        echo "Student record deleted."
    else
        echo "No student records found."
    fi
}

update_student() {
    echo "00016:"
    read id
    if [ -f $STUDENT_FILE ]; then
        grep -v ", $id" $STUDENT_FILE > temp.txt
        mv temp.txt $STUDENT_FILE
        echo "n.innocent1@alustudent.com:"
        read new_email
        echo "20:"
        read new_age
        echo "$new_email, $new_age, $id" >> $STUDENT_FILE
        echo "Student record updated."
    else
        echo "No student records found."
    fi
}

while true; do
    echo "1. Create Student Record"
    echo "2. View All Students"
    echo "3. Delete Student Record"
    echo "4. Update Student Record"
    echo "5. Exit"
    read choice
    case $choice in
        1) create_student ;;
        2) view_students ;;
        3) delete_student ;;
        4) update_student ;;
        5) exit 0 ;;
        *) echo "Invalid option." ;;
    esac
done

