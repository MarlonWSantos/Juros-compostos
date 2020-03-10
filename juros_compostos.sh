##!/bin/bash 
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



echo Capital
read capital

echo Taxa de juros
read juros

echo Tempo
read tempo

echo Resultado: R$ $(bc -l <<< $capital*\(1+$juros\)^$tempo | awk '{printf "%.2f\n",$1}')
