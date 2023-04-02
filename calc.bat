@echo off

:inicio
cls

echo ********************************************
echo *                                          *
echo *           CALCULADORA BASICA             *
echo *                                          *
echo ********************************************

echo Operaciones básicas:
echo.
echo   1. SUMAR
echo   2. RESTAR
echo   3. MULTIPLICAR
echo   4. DIVIDIR
echo   5. VER HISTORIAL OPERACIONES
echo   6. ABRIR LA CALCULADORA EN WINDOWS
echo   7. SALIR
echo.
set /p opcion=Selecciona una operacion a realizar: 

if %opcion%==1 goto sumar
if %opcion%==2 goto restar
if %opcion%==3 goto multiplicar
if %opcion%==4 goto dividir
if %opcion%==5 goto ver_historial
if %opcion%==6 goto abrir_calc
if %opcion%==7 goto salir

echo Opcion no valida
pause >nul
goto incio

set primerUso=true
:guardarLog
echo (%date% %time%) %num1% / %num2% = %result% >> log.txt

if "%primerUso%"=="true" (
    echo Creando archivo de registro...
    echo. > log.txt
    set primerUso=false
)

:sumar
set /p num1=Primer número:....................
set /p num2=Segundo número:...................
set /a result=%num1%+%num2%
echo                                        ----------
echo Resultado:                              %result%
call :guardarLog
pause >nul
goto inicio

:restar
set /p num1=Primer número:.................... 
set /p num2=Segundo número:................... 
set /a result=%num1%-%num2%
echo                                        ----------
echo Resultado:                              %result%
call :guardarLog
pause >nul
goto inicio

:multiplicar
set /p num1=Primer número:.................... 
set /p num2=Segundo número:................... 
set /a result=%num1%*%num2%
echo                                        ----------
echo Resultado:                              %result%
call :guardarLog
pause >nul
goto inicio

:dividir
set /p num1=Primer número:.................... 
set /p num2=Segundo número:...................
if %num2%==0 (
    echo No se puede dividir entre cero.
    pause >nul
    goto inicio
) else (
    set /a result=%num1%/%num2%
    echo                                     ----------
    echo Resultado:                           %result%
    call :guardarLog
    pause >nul
    goto inicio
)

:ver_historial
type log.txt
echo Pulsa cualquier tecla para ir al menu!
pause >nul
goto incio

:abrir_calc
start calc.exe
echo Pulsa la tecla 's' cuando quieras cerrar la calculadora de windows
set /p salir=s
if "%salir%"=="s" (
    taskkill /f /im calc.exe
    echo La calculadora se Windows se ha cerrado!
) else (
    echo La tecla pulsada no es la s
)

:salir
set /p opcion=Seguro que quieres salir?
echo.
echo   1. Si
echo   2. No

if %opcion%==1 exit
if %opcion%==2 goto inicio
echo Opcion no valida
pause >nul
goto salir