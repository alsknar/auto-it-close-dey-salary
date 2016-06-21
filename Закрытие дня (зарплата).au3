;
;
;           Закрытие дня (зарплата)
;
;        разработчик: Лаврененко А.Л.
;        дата создания: 20.05.2010
;        дата последнего изменения: 21.06.2016
;
;
;
; считывание данных с ini-файла
$sessions = IniRead("Закінчення дня_зп.ini", "sessions", "sessions_off", "NotFound")	; признак уничтожения сесии
$abonent = IniRead("Закінчення дня_зп.ini", "proccess", "abonent", "NotFound") 			; название процесса абонентской
$admin = IniRead("Закінчення дня_зп.ini", "proccess", "admin", "NotFound")     			; название процесса администратора
$exe1 = IniRead("Закінчення дня_зп.ini", "exe", "admin", "NotFound")           			; полный путь к exe-файлу абонентской
$exe2 = IniRead("Закінчення дня_зп.ini", "exe", "abonent", "NotFound")         			; полный путь к exe-файлу администратора
$base = IniRead("Закінчення дня_зп.ini", "base", "base", "NotFound")           			; полный путь к базе
$pack = IniRead("Закінчення дня_зп.ini", "pack", "pack", "NotFound")          			; полный путь к папке с архивами
$user = "Лаврененко А.Л."                                                       		; пользователь
$password = "" 				                                                     		; пароль
$date = @YEAR & "_" & @MON & "_" & @MDAY												; год_месяц_день в формате YYYY_MM_DD
$delay = 300																			; задержка ожидание активации окна (5 минут)

if $sessions = 1 Then
; уничтожение всех существующих процессов абонентскй и админинстратора
	RunWait(@SystemDir & "\taskkill.exe /F /IM " & $abonent, @SystemDir, @SW_HIDE)
	RunWait(@SystemDir & "\taskkill.exe /F /IM " & $admin, @SystemDir, @SW_HIDE)
EndIf
; полный контроль в администраторе
run($exe1 & " /D" & $base & "/N" & $user & "/P" & $password)
If WinWaitActive('Зарплата',"", $delay) = 0 Then
   ScreenShotExit($pack, $date)
EndIf
send('{ALT}')
Sleep(1000)
send('{DOWN}')
Sleep(1000)
send('{RIGHT}')
Sleep(1000)
send('{DOWN}')
send('{DOWN}')
send('{DOWN}')
send('{DOWN}')
Sleep(1000)
send('{ENTER}')
Sleep(1000)
send('{ENTER}')
If WinWaitActive('Зарплата','РЕЖИМ: Створення таблиці, якщо не існує', "", $delay) = 0 Then
   ScreenShotExit($pack, $date)
EndIf
send('!x')
sleep(5000)
; перерасчет базы данных
run($exe2 & " /D" & $base & "/N" & $user & "/P" & $password)
If WinWaitActive('Зарплата', "", $delay) = 0 Then
   ScreenShotExit($pack, $date)
EndIf
send('{ALT}')
send('{DOWN}')
send('{RIGHT}')
send('{DOWN}')
send('{ENTER}')
send('{ENTER}')
If WinWaitActive("Виконання формули розрахунку (ОСНОВНАЯ)",'OK', $delay) = 0 Then
   ScreenShotExit($pack, $date)
EndIf
send('{ENTER}')
send('{ALT}')
send('{RIGHT}')
send('{RIGHT}')
send('{RIGHT}')
send('{RIGHT}')
send('{DOWN}')
send('{DOWN}')
send('{DOWN}')
send('{DOWN}')
send('{DOWN}')
send('{DOWN}')
send('{DOWN}')
send('{ENTER}')
If WinWaitActive('Збереження даних', "", $delay) = 0 Then
   ScreenShotExit($pack, $date)
EndIf
; создание архива
send($pack & $date)
send('{ENTER}')
Sleep(5000)
If WinWaitActive('Зарплата', "", $delay) = 0 Then
   ScreenShotExit($pack, $date)
EndIf   )
send('!x')

Func ScreenShotExit($pack, $date)
   _ScreenCapture_Capture("" & $pack & "Error_" & $date & ".jpg")
   Exit
EndFunc
