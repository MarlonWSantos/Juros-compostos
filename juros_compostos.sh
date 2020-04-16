##!/usr/bin/env bash
#
#
#
#   Juros compostos.sh - Faz o cálculo simples de juros compostos 
#   Copyright (C) 2020 Marlon W. Santos <marlon.santos.santos@icen.ufpa.br>
#
#
#	
#   This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>
#
#   Fórmula:
#   M = C * ( 1 + i ) ^ t
#
#  M: Montante  
#  C: Capital
#  i: Juros   ( % ao mês ou % ao ano )
#  t: Tempo   ( por mês ou por ano )
#
#

while [ "$continue" != "n" -a "$continue" != "N" ]
do
	echo "Capital investido(Ex.:1.000,00):"
	read capital

	caracterInvalido=`echo $capital | sed 's/[0-9.,]//g' | wc -w`

	if [ "$caracterInvalido" -eq 0 ];then
		virgula=`echo $capital | sed 's/[^,]//g' | wc -w`
		
		if [ "$virgula" -eq 0 ];then
			capital=`echo $capital | sed 's/[.]//g'`
		else
			valorIntegral=`echo $capital | sed 's/,.*$//g' | sed 's/[.]//g'`
			centavos=`echo $capital | sed 's/^.*,//g'`
			capital=`echo $valorIntegral"."$centavos`
		fi
	
		echo "Taxa de juros"
		read juros
		juros=`echo $juros | sed 's/,/./g'`

		echo "Tempo"
		read tempo
		
		montante=`echo $capital*\(1+$juros\)^$tempo | bc -l | awk '{printf "%.2f\n",$1}'`
		
		echo "Resultado: R$"$montante
	else
		echo "Caracter inválido!"
	fi

	echo "Deseja continuar ? [S/n]"
	read continue
done


