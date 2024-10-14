#!/bin/bash

DISCO=$(sudo fdisk -l | grep "10 GiB" | awk '{print $2}' | awk -F ':' '{print $1}')

echo "######################################"
echo "Comienza Parcitiones en Disco: $DISCO"
echo "######################################"
echo
#PARTICIONES
sudo fdisk $DISCO << EOF

n
e



n

+1GiB
n

+1GiB
n

+1GiB
n

+1GiB
n

+1GiB
n

+1GiB
n

+1GiB
n

+1GiB
n

+1GiB
n


w

EOF
echo
echo "######################################"
echo "Termina Partciones"
echo "######################################"
echo
sudo fdisk -l $DISCO
echo
echo "######################################"
echo "Comienza Formateos"
echo "######################################"
echo
#FORMATEO
sudo mkfs.ext4 ${DISCO}5
sudo mkfs.ext4 ${DISCO}6
sudo mkfs.ext4 ${DISCO}7
sudo mkfs.ext4 ${DISCO}8
sudo mkfs.ext4 ${DISCO}9
sudo mkfs.ext4 ${DISCO}10
sudo mkfs.ext4 ${DISCO}11
sudo mkfs.ext4 ${DISCO}12
sudo mkfs.ext4 ${DISCO}13
sudo mkfs.ext4 ${DISCO}14
echo
echo "######################################"
echo "Termina Formateos"
echo "######################################"
echo
#MONTADO
echo "######################################"
echo "Comienza Montado"
echo "######################################"
echo
echo "${DISCO}5	/Examenes-UTN/alumno_1/parcial_1	ext4	defaults	0	0" | sudo tee -a /etc/fstab
echo "${DISCO}6	/Examenes-UTN/alumno_1/parcial_2	ext4	defaults	0	0" | sudo tee -a /etc/fstab
echo "${DISCO}7	/Examenes-UTN/alumno_1/parcial_3	ext4	defaults	0	0" | sudo tee -a /etc/fstab
echo "${DISCO}8	/Examenes-UTN/alumno_2/parcial_1	ext4	defaults	0	0" | sudo tee -a /etc/fstab
echo "${DISCO}9	/Examenes-UTN/alumno_2/parcial_2	ext4	defaults	0	0" | sudo tee -a /etc/fstab
echo "${DISCO}10	/Examenes-UTN/alumno_2/parcial_3	ext4	defaults	0	0" | sudo tee -a /etc/fstab
echo "${DISCO}11	/Examenes-UTN/alumno_3/parcial_1	ext4	defaults	0	0" | sudo tee -a /etc/fstab
echo "${DISCO}12	/Examenes-UTN/alumno_3/parcial_2	ext4	defaults	0	0" | sudo tee -a /etc/fstab
echo "${DISCO}13	/Examenes-UTN/alumno_3/parcial_3	ext4	defaults	0	0" | sudo tee -a /etc/fstab
echo "${DISCO}14	/Examenes-UTN/profesores	ext4	defaults	0	0" | sudo tee -a /etc/fstab
echo
echo "######################################"
echo "Termina Montado"
echo "######################################"
echo
sudo systemctl daemon-reload
sudo mount -a
