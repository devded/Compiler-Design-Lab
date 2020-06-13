## Problem statement
Imagine the syntax of a programming language construct such as while-loop
```
while ( condition ) 
begin 
      statement ; 
            : 
end

```

where _while_, _begin_, _end_ are keywords; condition can be a single comparision expression (such as `x == 20`, etc.); and statement is the assignment to a location the result of a single arithmatic operation (eg., `a = 10 * b`).<br>
Write a program that verifies whether the input follows the above syntax. Use flex to create the lexical analyser module and write a C program that performs the required task using that lexical analyser.

## How to run
- Download the `assignment.html` file and `test.txt` open `assignment.html` in your browser then inspect element and select console
