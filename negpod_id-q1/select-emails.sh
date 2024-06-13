#!/bin/bash

STUDENT_FILE="students-list_0524.txt"
EMAIL_FILE="student-emails.txt"

if [ -f $STUDENT_FILE ]; then
    awk -F', ' '{print $1}' $STUDENT_FILE | sort > $EMAIL_FILE
    echo "Student emails saved in ascending order to $EMAIL_FILE."
else
    echo "No student records found."
fi

