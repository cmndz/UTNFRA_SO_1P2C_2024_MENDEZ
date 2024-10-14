#!/bin/bash

HASH=$(sudo cat /etc/shadow | grep $(whoami) | awk -F ':' '{print $2}')
echo "######################################"
echo "Añadiendo Grupos"
echo "######################################"
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores
echo
cat /etc/group | grep 'p1c2_2024_g'
echo
echo "######################################"
echo "Añadiendo Usuarios"
echo "######################################"
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno -p "$HASH" p1c2_2024_A1
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno -p "$HASH" p1c2_2024_A2
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno -p "$HASH" p1c2_2024_A3
sudo useradd -m -s /bin/bash -G p1c2_2024_gProfesores -p "$HASH" p1c2_2024_P1
echo
cat /etc/passwd | grep 'p1c2_2024_'
echo
echo "######################################"
echo "Añadiendo Owners y Permisos"
echo "######################################"
sudo chown p1c2_2024_A1:p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo chown p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chown p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chown p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores
sudo chmod 750 /Examenes-UTN/alumno_1
sudo chmod 760 /Examenes-UTN/alumno_2
sudo chmod 700 /Examenes-UTN/alumno_3
sudo chmod 775 /Examenes-UTN/profesores
echo
ls -la /Examenes-UTN/
echo
echo "######################################"
echo "Creando Archivos Validar"
echo "######################################"
sudo su -c "whoami > /Examenes-UTN/alumno_1/validar.txt" p1c2_2024_A1
sudo su -c "whoami > /Examenes-UTN/alumno_2/validar.txt" p1c2_2024_A2
sudo su -c "whoami > /Examenes-UTN/alumno_3/validar.txt" p1c2_2024_A3
sudo su -c "whoami > /Examenes-UTN/profesores/validar.txt" p1c2_2024_P1
sudo tree /Examenes-UTN/
exit

