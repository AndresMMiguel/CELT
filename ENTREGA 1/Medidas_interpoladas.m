%% Entrega 1 CELT
clc,clear,close all
% Datos
new_frecuencia= [10 25 40 50 60 75 80 100 150 300 500 700 900 1000 2000 4000 5000 8000 10000 15000 20000 25000 35000 50000 75000 100000];
ganancia=[0.008 0.018 0.13 0.16 0.2 0.25 0.26 0.34 0.52 1.1 2 3.5 5.2 5.8 2.2 0.98 0.75 0.47 0.41 0.3 0.24 0.21 0.12 0.08 0.06 0.05];
gananciadB= 20*log10(ganancia);
frecuencia= [10 100 1000 10000 100000];
new_frecuencia2= [10000 15000 20000 25000 35000 50000 75000 100000];
fase=[272 268.2 176.4 87.6 89];
new_fase=interp1(frecuencia,fase,new_frecuencia,'spline')
plot(new_frecuencia,new_fase)