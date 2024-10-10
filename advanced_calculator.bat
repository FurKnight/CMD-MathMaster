@echo off
setlocal enabledelayedexpansion

set "memory=0"
set "history="
set /a calcCount=0

:menu
cls
echo Simple CMD Calculator
echo =======================
echo 1. Addition
echo 2. Subtraction
echo 3. Multiplication
echo 4. Division
echo 5. Percentage
echo 6. Square
echo 7. Square Root
echo 8. Exponentiation
echo 9. Memory Functions
echo 10. Calculation History
echo 11. Unit Conversions
echo 12. Exit
echo.

set /p choice="Choose an operation (1-12): "

if "%choice%"=="1" (
    call :addition
) else if "%choice%"=="2" (
    call :subtraction
) else if "%choice%"=="3" (
    call :multiplication
) else if "%choice%"=="4" (
    call :division
) else if "%choice%"=="5" (
    call :percentage
) else if "%choice%"=="6" (
    call :square
) else if "%choice%"=="7" (
    call :squareRoot
) else if "%choice%"=="8" (
    call :exponentiation
) else if "%choice%"=="9" (
    call :memoryMenu
) else if "%choice%"=="10" (
    call :calculationHistory
) else if "%choice%"=="11" (
    call :unitConversions
) else if "%choice%"=="12" (
    exit /b
) else (
    echo Invalid choice! Please try again.
    pause
    goto menu
)

goto menu

:addition
cls
echo Addition
call :getNumbers
set /a result=num1+num2
call :storeHistory "Addition: !num1! + !num2! = !result!"
echo Result: !num1! + !num2! = !result!
pause
exit /b

:subtraction
cls
echo Subtraction
call :getNumbers
set /a result=num1-num2
call :storeHistory "Subtraction: !num1! - !num2! = !result!"
echo Result: !num1! - !num2! = !result!
pause
exit /b

:multiplication
cls
echo Multiplication
call :getNumbers
set /a result=num1*num2
call :storeHistory "Multiplication: !num1! * !num2! = !result!"
echo Result: !num1! * !num2! = !result!
pause
exit /b

:division
cls
echo Division
call :getNumbers
if %num2%==0 (
    echo Error: Division by zero is not allowed!
) else (
    set /a result=num1/num2
    call :storeHistory "Division: !num1! / !num2! = !result!"
    echo Result: !num1! / !num2! = !result!
)
pause
exit /b

:percentage
cls
echo Percentage Calculation
set /p "num=Enter the number: "
set /p "percent=Enter the percentage: "
set /a result=num*percent/100
call :storeHistory "Percentage: !percent!%% of !num! = !result!"
echo Result: !percent!%% of !num! = !result!
pause
exit /b

:square
cls
echo Square Calculation
set /p "num=Enter the number: "
set /a result=num*num
call :storeHistory "Square: !num!^2 = !result!"
echo Result: !num!^2 = !result!
pause
exit /b

:squareRoot
cls
echo Square Root Calculation
set /p "num=Enter the number: "
set /a result=num^0.5
call :storeHistory "Square Root: sqrt(!num!) = !result!"
echo Result: sqrt(!num!) = !result!
pause
exit /b

:exponentiation
cls
echo Exponentiation
set /p "base=Enter the base: "
set /p "exp=Enter the exponent: "
set /a result=base^exp
call :storeHistory "Exponentiation: !base!^!exp! = !result!"
echo Result: !base!^!exp! = !result!
pause
exit /b

:memoryMenu
cls
echo Memory Functions
echo =================
echo 1. Memory Add (M+)
echo 2. Memory Subtract (M-)
echo 3. Memory Recall (MR)
echo 4. Memory Clear (MC)
echo 5. Back to Main Menu
echo.

set /p memChoice="Choose an option (1-5): "

if "%memChoice%"=="1" (
    set /p "num=Enter number to add to memory: "
    set /a memory+=num
    echo Memory updated: !memory!
) else if "%memChoice%"=="2" (
    set /p "num=Enter number to subtract from memory: "
    set /a memory-=num
    echo Memory updated: !memory!
) else if "%memChoice%"=="3" (
    echo Memory value: !memory!
) else if "%memChoice%"=="4" (
    set memory=0
    echo Memory cleared!
) else if "%memChoice%"=="5" (
    goto menu
) else (
    echo Invalid choice! Please try again.
)

pause
goto memoryMenu

:calculationHistory
cls
echo Calculation History
echo ====================
echo !history!
if "!history!"=="" (
    echo No calculations made yet.
)
pause
exit /b

:getNumbers
set /p "num1=Enter first number: "
set /p "num2=Enter second number: "
exit /b

:storeHistory
set "history=!history!!1!^!"
set /a calcCount+=1
exit /b

:unitConversions
cls
echo Unit Conversions
echo =================
echo 1. Kilometers to Miles
echo 2. Miles to Kilometers
echo 3. Celsius to Fahrenheit
echo 4. Fahrenheit to Celsius
echo 5. Back to Main Menu
echo.

set /p convChoice="Choose a conversion (1-5): "

if "%convChoice%"=="1" (
    set /p "km=Enter kilometers: "
    set /a miles=km/1.609
    echo Result: !km! km = !miles! miles
) else if "%convChoice%"=="2" (
    set /p "miles=Enter miles: "
    set /a km=miles*1.609
    echo Result: !miles! miles = !km! km
) else if "%convChoice%"=="3" (
    set /p "celsius=Enter Celsius: "
    set /a fahrenheit=celsius*9/5+32
    echo Result: !celsius! C = !fahrenheit! F
) else if "%convChoice%"=="4" (
    set /p "fahrenheit=Enter Fahrenheit: "
    set /a celsius=(fahrenheit-32)*5/9
    echo Result: !fahrenheit! F = !celsius! C
) else if "%convChoice%"=="5" (
    goto menu
) else (
    echo Invalid choice! Please try again.
)

pause
goto unitConversions
