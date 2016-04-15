# Tugas2CI
Tugas 2 Kecerdasan Komputasi

Tugas 2 Computational Intellegence
Algoritma Genetika
Oleh : Ida Bagus Gede Bayu Priyanta

Permasalahan : 
	~ Mengoptimalkan persamaan 120x+150y+25z
	~ Constraint : 
		~ x >= 20
		~ y <= 80

Struktur Individu : 
	~ Individu terdiri dari 1 kromosom dengan 3 gen
	~ 1 Gen mewakili 1 variabel (x,y dan z)
	~ Nilai awal adalah random

Ukuran Populasi : 
	~ 1 populasi akan memiliki 10 individu

Probabilitas Crossover : 
	~ PC yang digunakan adalah sebesar : 60%
	~ Artinya akan dihasilkan 6 offspring di setiap crossover dengan menggunakan 3 pasang parent

Pemilihan Parent Crossover
	~ Pemilihan dilakukan dengan metode Roullete Wheel
	~ Pemilihan akan dilakukan sebanyak 6 kali untuk menemukan 3 pasang parent
	~ Sepasang parent akan menghasilkan 2 offspring

Probabilitas Mutasi
	~ Probabilitas dilakukannya mutasi sebesar 20%
	~ Karena sedikitnya jumlah individu, maka mutasi dilakukan sebanyak 20% dari jumlah total populasi awal
	~ Jadi akan ada 2 individu yang akan terkena  mutasi
	~ Setiap individu yang terkena mutasi hanya akan dirubah nilai 1 gennya saja (secara acak)
	~ Gen yang terpilih juga dipilih secara acak
	
Operator Crossover
	~ Operator Crossover yang digunakan adalah operator uniform
	~ Dengan menggunakan matrix [ 0 1 0 ]
	~ Jadi hanya gen ke 2 saja yang akan ditukar
	
Stop Condition
	~ Pembuatan generasi baru terhenti ketika generasi ke 5000 tercipta
	~ Menggunakan batas iterasi maximum sebanyak 5000

