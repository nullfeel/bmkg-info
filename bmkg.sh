#!/bin/bash

##################################################################
#			        Coded by		         #
# 			        FrostFex    			 #	
##################################################################
#Download data
wget -O temp.bmkg -q http://data.bmkg.go.id/autogempa.xml
wget -O temp.bmkgtsu -q http://data.bmkg.go.id/lasttsunami.xml

#Variabel Gempa
tanggal=$(grep -oP '(?<=<Tanggal>).*?(?=</Tanggal>)' temp.bmkg )
jam=$(grep -oP '(?<=<Jam>).*?(?=</Jam>)' temp.bmkg )
kordinat=$(grep -oP '(?<=<coordinates>).*?(?=</coordinates>)' temp.bmkg )
l=$(grep -oP '(?<=<Lintang>).*?(?=</Lintang>)' temp.bmkg )
b=$(grep -oP '(?<=<Bujur>).*?(?=</Bujur>)' temp.bmkg )
m=$(grep -oP '(?<=<Magnitude>).*?(?=</Magnitude>)' temp.bmkg )
dalam=$(grep -oP '(?<=<Kedalaman>).*?(?=</Kedalaman>)' temp.bmkg )
w1=$(grep -oP '(?<=<Wilayah1>).*?(?=</Wilayah1>)' temp.bmkg )
w2=$(grep -oP '(?<=<Wilayah2>).*?(?=</Wilayah2>)' temp.bmkg )
w3=$(grep -oP '(?<=<Wilayah3>).*?(?=</Wilayah3>)' temp.bmkg )
w4=$(grep -oP '(?<=<Wilayah4>).*?(?=</Wilayah4>)' temp.bmkg )

#Variabel Tsunami
tt=$(grep -oP '(?<=<Tanggal>).*?(?=</Tanggal>)' temp.bmkgtsu )
jjm=$(grep -oP '(?<=<Jam>).*?(?=</Jam>)' temp.bmkgtsu )
Lintang=$(grep -oP '(?<=<Lintang>).*?(?=</Lintang>)' temp.bmkgtsu )
Bujur=$(grep -oP '(?<=<Bujur>).*?(?=</Bujur>)' temp.bmkgtsu )
mag=$(grep -oP '(?<=<Magnitude>).*?(?=</Magnitude>)' temp.bmkgtsu)
ked=$(grep -oP '(?<=<Kedalaman>).*?(?=</Kedalaman>)' temp.bmkgtsu )
area=$(grep -oP '(?<=<Area>).*?(?=</Area>)' temp.bmkgtsu )

#Menu
printf "========================================= \n"| lolcat
printf "=               BMKG INFO               = \n"| lolcat
printf "=                                       =\n"| lolcat
printf "=Note: Koneksi internet di butuhkkan    =\n"| lolcat
printf "=Contact Dev: fb.me/bima.mrth           =\n"| lolcat
printf "=========================================\n"| lolcat
echo ""
echo ""
echo "1.Info Gempa"
echo "2.Info Tsunami"
echo "3.Pesan"
echo "4.Keluar"
echo -n "Pilih nomernya >"|lolcat
read no

if [[ $no == "1" ]]; then

printf "====== Info Gempa ======= \n"|lolcat
printf "Tanggal dan Waktu : $tanggal - $jam \n"
printf "lintang   : $l \n"
printf "Bujur     : $b \n"
printf "Magnitude : $m \n"
printf "Kedalaman : $dalam \n"
printf "Wilayah   : $w1 \n"
printf "Wilayah   : $w2 \n"
printf "Wilayah   : $w3 \n"
printf "Wilayah   : $w4 \n"
printf "====== END INFO ======== \n"|lolcat -a -d 500
printf ""

fi

if [[ $no == "2" ]]; then

printf "======== Info Tsunami ========\n" | lolcat
printf "Tanggal dan Waktu : $tt - $jjm \n"
printf "Lintang   : $Lintang \n"
printf "Bujur     : $Bujur \n"
printf "Magnitude : $mag \n"
printf "Kedalaman : $ked \n"
printf "Area      : $area \n"
printf "======== END INFO ==========\n"|lolcat -a -d 500
fi
if [[ $no == "3" ]]; then

printf "====== Pesan ========== \n"| lolcat
curl -s http://data.bmkg.go.id/pesan.txt |tr '\n'
printf "====== END PESAN ====== \n"|lolcat -a -d 500

fi
if [[ $no == "4" ]]; then

printf "BYEE"
 exit0
fi
