#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os 
dir_path = os.path.dirname(os.path.realpath(__file__))

#le o arquivo das hastes e o transforma em um array de inteiros
arquivo = open('{0}\hastes.txt'.format(dir_path),'r')
texto = arquivo.read()
arr = [int(array_conv) for array_conv in texto.split()]
size = len(arr)
arquivo.close() 


#le o arquivo das atividades e o transforma em um array de inteiros
arquivo2 = open("{0}\haste_atividade.txt".format(dir_path),'r')
text2 = arquivo2.read()
arr2 = [int(array2_conv) for array2_conv in text2.split()]
inicio = arr2[0:10]
fim = arr2[11:21]
arquivo2.close()


def cutRod(price, tamanho):
    if(tamanho <= 0):
        return 0

    max_val = -1
    
    for i in range(tamanho):
        max_val = max(max_val, price[i] +
                      cutRod(price, tamanho - i - 1))
    return max_val

def cutRodMemo(prices, tamanho):

    if tamanho == 0:
        return 0

    new_rec = [-1 for i in range(tamanho)]
    
    return cutRodMemoAux(prices, tamanho, new_rec)

def cutRodMemoAux(prices, tamanho, new_rec):
    
    max_val = -1

    if new_rec[tamanho - 1] >= 0:
        return new_rec[tamanho - 1]
    if tamanho == 0:
        max_val = 0
    else:
        for i in range(0, tamanho):
            max_val = max(max_val,prices[i] + cutRodMemoAux(prices[:tamanho - i - 1],tamanho - i - 1,new_rec))
    
    new_rec[tamanho - 1] = max_val
    
    return max_val

def bottomUPcutRod(prices, tamanho):

    max_val = -1
    new_rec = [0 for i in range(tamanho + 1)] 
                                     
    for j in range(1, tamanho + 1):  
        max_val = -1
        for i in range(j):
            max_val = max(max_val, prices[i] + new_rec[j - i - 1])

        new_rec[j] = max_val

    return new_rec[tamanho]


def greedActivitySelector(inic,fim):

    qtd = len(inic)
    activity = []

    i = 0
    activity.append(i)

    for j in range(qtd):
        if inic[j] >= i:
            activity.append(j)
            i = j    

    return activity

print("Valor maximo obtido com o algoritimo recursivo de cima para baixo é " + str(cutRod(arr, size)))
print("Valor maximo obtido com o algoritomo recursivo de cima para baixo com memorizacao é " + str(cutRodMemo(arr, size)))
print("Valor maximo obtido com o algoritimo recursivo de baixo para cima é " + str(cutRod(arr, size)))
print("As ativdade selecionadas foram as seguintes " + str(greedActivitySelector(inicio,fim)))