;
;
;           �������� ��� (��������)
;
;        �����������: ���������� �.�.
;        ���� ��������: 20.05.2010
;        ���� ���������� ���������: 21.06.2016
;
;
;
; ���������� ������ � ini-�����
$sessions = IniRead("��������� ���_��.ini", "sessions", "sessions_off", "NotFound")	; ������� ����������� �����
$abonent = IniRead("��������� ���_��.ini", "proccess", "abonent", "NotFound") 			; �������� �������� �����������
$admin = IniRead("��������� ���_��.ini", "proccess", "admin", "NotFound")     			; �������� �������� ��������������
$exe1 = IniRead("��������� ���_��.ini", "exe", "admin", "NotFound")           			; ������ ���� � exe-����� �����������
$exe2 = IniRead("��������� ���_��.ini", "exe", "abonent", "NotFound")         			; ������ ���� � exe-����� ��������������
$base = IniRead("��������� ���_��.ini", "base", "base", "NotFound")           			; ������ ���� � ����
$pack = IniRead("��������� ���_��.ini", "pack", "pack", "NotFound")          			; ������ ���� � ����� � ��������
$user = "���������� �.�."                                                       		; ������������
$password = "" 				                                                     		; ������

if $sessions = 1 Then
; ����������� ���� ������������ ��������� ���������� � ���������������
	RunWait(@SystemDir & "\taskkill.exe /F /IM " & $abonent, @SystemDir, @SW_HIDE)
	RunWait(@SystemDir & "\taskkill.exe /F /IM " & $admin, @SystemDir, @SW_HIDE)
EndIf
; ������ �������� � ��������������
run($exe1 & " /D" & $base & "/N" & $user & "/P" & $password)
WinWaitActive('��������')
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
WinWaitActive('��������','�����: ��������� �������, ���� �� ����')
send('!x')
sleep(5000)
; ���������� ���� ������
run($exe2 & " /D" & $base & "/N" & $user & "/P" & $password)
WinWaitActive('��������')
send('{ALT}')
send('{DOWN}')
send('{RIGHT}')
send('{DOWN}')
send('{ENTER}')
send('{ENTER}')
WinWaitActive("��������� ������� ���������� (��������)",'OK')
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
$date = @YEAR & "_" & @MON & "_" & @MDAY
WinWaitActive('���������� �����')
; �������� ������
send($pack & $date)
send('{ENTER}')
Sleep(5000)
WinWaitActive('��������')
send('!x')
