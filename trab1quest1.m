%TRABALHO 01 QUESTÃO 01
%JOSÉ ANAHELTON SOUSA FONTELES - 356721

%{
ENUNCIADO QUESTÃO 1:
Construa um programa baseado em lógica fuzzy (inferência de Mamdani) conforme
as regras disponibilizadas no Exercício 18 do livro “Inteligência Computacional
Aplicada à Administração, Economia e Engenharia em Matlab”, Hime Aguiar e
Oliveira Junior (Coordenadores), Caldeira, A. M.; Machado, M. A. S.; Sousa, R. C.;
Tanscheit, R.; Thomson Learning, 2007. O programa deverá solicitar as entradas ao
usuário e exibir a saída produzida.
%}

%{
REGRAS
Regra 1 Se a temperatua é pequeno e o preço é baixo, então o consumo é grande. 
Regra 2 Se a temperatua é pequeno e o preço é médio, então o consumo é médio.
Regra 3 Se a temperatua é pequeno e o preço é alto, então o consumo é pequeno.
Regra 4 Se a temperatua é média e o preço é baixo, então o consumo é grande.
Regra 5 Se a temperatua é média e o preço é médio, então o consumo é médio.
Regra 6 Se a temperatua é média e o preço é alto, então o consumo é pequeno.
Regra 7 Se a temperatua é alta e o preço é baixo, então o consumo é grande.
Regra 8 Se a temperatua é alta e o preço é médio, então o consumo é médio.
Regra 9 Se a temperatua é alta e o preço é alto, então o consumo é pequeno.
%}

%{
Temperatura 15 a 45 graus
15 <= baixa < 30
30 = média
30 < alta <=45

Preço 1 a 6
1 <= baixo < 3.05
3.05 = médio
3.05 < alto <= 6

Consumo 500 a 6000
500 <= pequeno < 3250
3250 == médio 
3250 < grande <= 6000
%}

%{
***************************************************************************
*                        TEMPERATURA AMBIENTE                             *
***************************************************************************
%}

clc;
%Recebe os valores, definidos de 15 a 45, do usuário
Temperatura = input("Digite um número de 15 a 45 graus para a temperatura do refrigerante: "); 
%Teste para verificar se foi digitado um valor válido
if(Temperatura > 45 || Temperatura < 15 ) 
    Temperatura = input("Valor inválido, por favor digite um valor entre 15 e 45 graus: \n");
end

% Definindo os Conjuntos Nebulosos e as funções de Pertinência:
% Conjuntos Nebulosos relacionados a Temperatura %

%Temperatura Baixa
if(Temperatura >= 15 && Temperatura < 30 ) 
    Baixa = (((-1)*Temperatura)/15) + 1;
    fprintf("A Temperatura de valor (%.2f) tem valor de pertinencia BAIXO igual a:%3f\n ",Temperatura,Baixa);
else
    Baixa = 0.0;
    fprintf("A Temperatura de valor (%.2f) tem valor de pertinencia BAIXO igual a:%3f\n ",Temperatura,Baixa);
end

%Temperatura Média
if(Temperatura == 30) 
    Media = (Temperatura)/30 + 1;
    fprintf("A Temperatura de valor (%.2f)tem valor de pertinencia MEDIA igual a:%3f\n ",Temperatura,Media);
else 
    Media = 0.0;
    fprintf("A Temperatura de valor (%.2f)tem valor de pertinencia MEDIA igual a:%3f\n ",Temperatura,Media);
end

%Temperatura Alta
if(Temperatura > 30 && Temperatura <= 45 ) 
    Alta = (Temperatura)/15 - 30/15;
    fprintf("A Temperatura de valor (%.2f)tem valor de pertinencia ALTA igual a:%3f\n ",Temperatura,Alta);
else
    Alta = 0.0;
    fprintf("A Temperatura de valor (%.2f)tem valor de pertinencia ALTA igual a:%3f\n ",Temperatura,Alta);
end

fprintf("\n");
fprintf("\n");

%{
***************************************************************************
*                           PREÇO UNITÁRIO                                *
***************************************************************************
%}
%Recebe os valores, definidos de 1 a 6, do usuário
Preco = input("Digite um número de 1 a 6 para o Preco unitario do refrigerante: ");
%Teste para verificar se foi digitado um valor válido
if(Preco > 6 || Preco < 1 ) 
    Preco = input("Valor inválido, por favor digite um valor entre 1 e 6: \n");
end

%Preço baixo
if(Preco >= 1 && Preco < 3.05) 
    Baixo = (((-1)*Preco)/2.05) - 1/2.05;
    fprintf("o Preco unitario de valor (%.2f) tem valor de pertinencia BAIXO igual a:%3f\n ",Preco,Baixo);
else
    Baixo = 0.0;
    fprintf("o Preco unitario de valor (%.2f) tem valor de pertinencia BAIXO igual a:%3f\n ",Preco,Baixo);
end

%Preço médio
if(Preco == 3.05) 
    Medio = (Preco)/3.05 + 1; 
    fprintf("o Preco unitario de valor (%.2f)tem valor de pertinencia MEDIA igual a:%3f\n ",Preco, Medio);
else 
    Medio = 0.0;
    fprintf("o Preco unitario de valor (%.2f)tem valor de pertinencia MEDIA igual a:%3f\n ",Preco, Medio);
end

%Preço alto
if(Preco > 3.05 && Preco <= 6) 
    Alto = (Preco)/2.95 - 3.05/2.95;
    fprintf("o Preco unitario de valor (%.2f)tem valor de pertinencia ALTA igual a:%3f\n ",Preco, Alto);
else
    Alto = 0.0;
    fprintf("o Preco unitario de valor (%.2f)tem valor de pertinencia ALTA igual a:%3f\n ",Preco, Alto);
end

fprintf("\n"); 

%{
***************************************************************************
*                               REGRAS                                    *
***************************************************************************
%}

%Regra 1 Se a temperatua é pequeno e o preço é baixo, então o consumo é grande. 
if((Temperatura >= 15 && Temperatura < 30) && (Preco >= 1 && Preco < 3.05)) 
    fprintf("De acordo com a Regra 1 o consumo será GRANDE");
%Regra 2 Se a temperatua é pequeno e o preço é médio, então o consumo é médio.    
elseif((Temperatura >= 15 && Temperatura < 30) && (Preco == 3.05))
    fprintf("De acordo com a Regra 2 o consumo será MÉDIO");
% Regra 3 Se a temperatua é pequeno e o preço é alto, então o consumo é pequeno.  
elseif((Temperatura >= 15 && Temperatura < 30) && (Preco >3.05 && Preco <= 6))
    fprintf("De acordo com a Regra 3 o consumo será PEQUENO");    
% Regra 4 Se a temperatua é média e o preço é baixo, então o consumo é grande.
elseif((Temperatura == 30) && (Preco >= 1 && Preco < 3.05))
    fprintf("De acordo com a Regra 4 o consumo será GRANDE");    
% Regra 5 Se a temperatua é média e o preço é médio, então o consumo é médio.
elseif((Temperatura == 30) && (Preco == 3.05))
    fprintf("De acordo com a Regra 5 o consumo será MÉDIO");     
% Regra 6 Se a temperatua é média e o preço é alto, então o consumo é pequeno.
elseif((Temperatura == 30) && (Preco >3.05 && Preco <= 6))
    fprintf("De acordo com a Regra 6 o consumo será PEQUENO");   
% Regra 7 Se a temperatua é alta e o preço é baixo, então o consumo é grande.
elseif((Temperatura > 30 && Temperatura <= 45) && (Preco >= 1 && Preco < 3.05))
    fprintf("De acordo com a Regra 7 o consumo será GRANDE");    
% Regra 8 Se a temperatua é alta e o preço é médio, então o consumo é médio.
elseif((Temperatura > 30 && Temperatura <= 45) && (Preco == 3.05))
    fprintf("De acordo com a Regra 8 o consumo será MÉDIO");    
% Regra 9 Se a temperatua é alta e o preço é alto, então o consumo é pequeno. 
elseif((Temperatura > 30 && Temperatura <= 45) && (Preco >3.05 && Preco <= 6))
    fprintf("De acordo com a Regra 9 o consumo será PEQUENO"); 
end
fprintf("\n");

consumo = 500:1:6000;
c_pequeno = trimf(consumo,[-2250 500 3250]);
c_medio = trimf(consumo,[500 3250 6000]);
c_grande = trimf(consumo,[3250 6000 8750]);
mf = max(0.5*c_medio,max(0.9*c_pequeno,0.1*c_grande));

plot(consumo,mf,'LineWidth',3);

soma = 0;  
div = 0;
%Calculo do centroide para defuzzification 
for i=1:1:5500
     soma = soma + ((mf(i)*i));
     div = div + (mf(i));      
end
total = (soma/div);   
fprintf("O Valor do consumo será igual a: %.0f\n", total);   


