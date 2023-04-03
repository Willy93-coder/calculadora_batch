@echo off

:inicio
cls

echo ********************************************
echo *                                          *
echo *           CALCULADORA BASICA             *
echo *                                          *
echo ********************************************

echo Operaciones basicas:
echo.
echo   1. SUMAR
echo   2. RESTAR
echo   3. MULTIPLICAR
echo   4. DIVIDIR
echo   5. VER HISTORIAL OPERACIONES
echo   6. ABRIR LA CALCULADORA EN WINDOWS
echo   7. CONVERTIR NUMERO A BINARIO
echo   8. ABRIR CALCULADORA EN NAVEGADOR
echo   9. SALIR
echo.
set /p opcion=Selecciona una operacion a realizar: 

if %opcion%==1 goto sumar
if %opcion%==2 goto restar
if %opcion%==3 goto multiplicar
if %opcion%==4 goto dividir
if %opcion%==5 goto ver_historial
if %opcion%==6 goto abrir_calc
if %opcion%==7 goto dec_binario
if %opcion%==8 goto calc_linea
if %opcion%==9 goto salir

echo Opcion no valida
pause >nul
goto incio

set primerUso=true

if "%primerUso%"=="true" (
    echo Creando archivo de registro...
    echo. > log.txt
    set primerUso=false
)

:sumar
set /p num1=Primer numero:.................... 
echo                                    +
set /p num2=Segundo numero:................... 
set /a result=%num1%+%num2%
echo                                ----------
echo Resultado:                         %result%
echo (%date% %time%) %num1% + %num2% = %result% >> log.txt
pause
goto inicio

:restar
set /p num1=Primer numero:.................... 
echo                                    -
set /p num2=Segundo numero:................... 
set /a result=%num1%-%num2%
echo                                ----------
echo Resultado:                         %result%
echo (%date% %time%) %num1% - %num2% = %result% >> log.txt
pause
goto inicio

:multiplicar
set /p num1=Primer numero:.................... 
echo                                    *
set /p num2=Segundo numero:................... 
set /a result=%num1%*%num2%
echo                                ----------
echo Resultado:                         %result%
echo (%date% %time%) %num1% * %num2% = %result% >> log.txt
pause
goto inicio

:dividir
set /p num1=Primer numero:.................... 
echo                                    /
set /p num2=Segundo numero:................... 
if %num2%==0 (
    echo No se puede dividir entre cero.
    pause
    goto inicio
) 
set /a result=%num1%/%num2%
    echo                                ----------
    echo Resultado:                         %result%
    echo (%date% %time%) %num1% / %num2% = %result% >> log.txt
    pause
    goto inicio


:ver_historial
type log.txt
set /p eleccion=Escribe la letra 'd' para borrar el historial o la letra 'r' para volver al menu!
if "%eleccion%"=="r" (
    goto inicio
) else (
    if "%eleccion%"=="d" (
        del log.txt
        goto inicio
    ) else (
        echo Te has equivocado de letra. Vuelvelo a intentar!!
        pause > nul
        goto ver_historial
    )
)

:abrir_calc
start calc.exe
set /p goout=Pulsa la tecla 's' para cerrar la calculadora: 
if "%goout%"=="s" taskkill /f /fi "WINDOWTITLE eq Calculadora"
pause
echo La calculadora se Windows se ha cerrado!
goto inicio

:dec_binario
set /p num=Introduce un numero entero decimal: 
set bin=2
set "resultado="
set "dectobin="
:while
if %num% GTR 0 (
    set /a r=%num%%%bin%
    set /a num=%decimal% / %bin%
    set resultado=%r%%resultado%
    goto :while
)
set dectobin=%resultado%
echo El numero entero decimal %num% en binario es %dectobin%
pause
goto inicio

:calc_linea
start https://www.google.com/search?q=calculadora+en+linea
pause
goto incio

:salir
echo Seguro que quieres salir?
echo.
echo   1. Si
echo   2. No
echo.
set /p option=(S/N)? 

if "%option%"=="s" exit
if "%option%"=="n" goto inicio
echo Opcion no valida
pause
goto salir