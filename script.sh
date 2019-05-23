# Escriba su código aquí
awk NF data1.csv > out1																		# Borra líneas vacías
awk NF data2.csv > out2																		# Borra líneas vacías
awk NF data3.csv > out3																		# Borra líneas vacías
sed '1 s|^\([A-Z]\)|data1.csv,1,\1,|'g  out1 > out4											# Adiciona la primera fila con el nombre del archivo y el número de fila
sed '2 s|^\([A-Z]\)|data1.csv,2,\1,|'g  out4 > out5											# Adiciona la primera fila con el nombre del archivo y el número de fila
sed '3 s|^\([A-Z]\)|data1.csv,3,\1,|'g  out5 > out6											# Adiciona la primera fila con el nombre del archivo y el número de fila
sed '1 s|^\([A-Z]\)|data2.csv,1,\1,|'g  out2 > out7											# Adiciona la primera fila con el nombre del archivo y el número de fila
sed '2 s|^\([A-Z]\)|data2.csv,2,\1,|'g  out7 > out8											# Adiciona la primera fila con el nombre del archivo y el número de fila
sed '1 s|^\([A-Z]\)|data3.csv,1,\1,|'g  out3 > out9											# Adiciona la primera fila con el nombre del archivo y el número de fila
sed '2 s|^\([A-Z]\)|data3.csv,2,\1,|'g  out9 > out10										# Adiciona la primera fila con el nombre del archivo y el número de fila
sed '3 s|^\([A-Z]\)|data3.csv,3,\1,|'g  out10> out11										# Adiciona la primera fila con el nombre del archivo y el número de fila
sed '1 s|,\([a-z]\)\([a-z]\)\([a-z]\):\([0-9]\)|,data1.csv,1,E,\1\2\3:\4|'g out6  > out12	# Adiciona el nombre del archivo y la primera letra a la línea 1
sed '2 s|,\([a-z]\)\([a-z]\)\([a-z]\):\([0-9]\)|,data1.csv,2,A,\1\2\3:\4|'g out12 > out13	# Adiciona el nombre del archivo y la primera letra a la línea 2
sed '3 s|,\([a-z]\)\([a-z]\)\([a-z]\):\([0-9]\)|,data1.csv,3,B,\1\2\3:\4|'g out13 > out14	# Adiciona el nombre del archivo y la primera letra a la línea 3
sed '1 s|,\([a-z]\)\([a-z]\)\([a-z]\):\([0-9]\)|,data2.csv,1,A,\1\2\3:\4|'g out8  > out15	# Adiciona el nombre del archivo y la primera letra a la línea 1
sed '2 s|,\([a-z]\)\([a-z]\)\([a-z]\):\([0-9]\)|,data2.csv,2,C,\1\2\3:\4|'g out15 > out16	# Adiciona el nombre del archivo y la primera letra a la línea 2 
sed '1 s|,\([a-z]\)\([a-z]\)\([a-z]\):\([0-9]\)|,data3.csv,1,A,\1\2\3:\4|'g out11 > out17	# Adiciona el nombre del archivo y la primera letra a la línea 1 
sed '2 s|,\([a-z]\)\([a-z]\)\([a-z]\):\([0-9]\)|,data3.csv,2,A,\1\2\3:\4|'g out17 > out18	# Adiciona el nombre del archivo y la primera letra a la línea 2
sed '3 s|,\([a-z]\)\([a-z]\)\([a-z]\):\([0-9]\)|,data3.csv,3,B,\1\2\3:\4|'g out18 > out19	# Adiciona el nombre del archivo y la primera letra a la línea 3
sed 's|\t||'g out14 > out20																	# Elimina las tabulaciones del archivo
sed 's|\t||'g out16 > out21																	# Elimina las tabulaciones del archivo
sed -i 's| *||'g out21																		# Elimina los espacios en blanco del archivo
sed 's|\t||'g out19 > out22																	# Elimina las tabulaciones del archivo
perl -pe 's|\n|\r\n|' out20 > out23															# Adiciona retorno de carro a las líneas que no lo tienen
perl -pe 's|\n|\r\n|' out21 > out24															# Adiciona retorno de carro a las líneas que no lo tienen
perl -pe 's|\n|\r\n|' out22 > out25															# Adiciona retorno de carro a las líneas que no lo tienen
cat out23 out24 out25 > out26																# Concatena los archivos creados
sed 's|:\([0-9]\),|:\1\n|'g out26 > out27													# Adiciona retorno de carro para separar por líneas
perl -pe 's|\n|\r\n|' out27 > out28															# Adiciona salto de línea
rm out* 