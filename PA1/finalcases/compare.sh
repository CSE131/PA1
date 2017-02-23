#!/bin/bash

score=0

for i in bool1 bool2 comment1 comment2 field1 field2 ident1 ident2 keyword1 keyword2 num1 num2 oper1 oper2 tab1 tab2; do
    ../../glc < ${i}.glsl &> ${i}.mine.out
    diff ${i}.out ${i}.mine.out &> /dev/null
    if [ $? -eq 0 ]
    then
	printf "%8s: passed\n" "$i"
	((score++))
    else
	printf "%8s: failed\n" "$i"
    fi
done

echo -e "\nScore = ${score}/16"
echo "+2 if a clean build doesn't give any warnings"
echo "+2 if you submitted a meaningful Project_Description.txt"
