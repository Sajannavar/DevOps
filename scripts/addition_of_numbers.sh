#!/bin/bash
#***********************
#Task 4: Using Variables
#***********************
echo "Current Shell PID: $$"
echo "Addition of two numbes using read input from user."
echo "Enter the First Number :"
read num1
echo "Enter the second Number :"
read num2

num3=$((num1+num2))

echo "Addition of $num1 and $num2 is : $num3";
