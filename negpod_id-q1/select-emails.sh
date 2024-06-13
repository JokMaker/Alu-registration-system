#!/bin/bash

STUDENT_FILE="students-list_0524.txt"
EMAIL_FILE="student-emails.txt"

if [ -f $STUDENT_FILE ]; then
    cut -d',' -f1 $STUDENT_FILE > $EMAIL_FILE
    echo "Emails extracted to $EMAIL_FILE"
else
    echo "No student records found."
fi
