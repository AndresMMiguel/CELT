%% Entrega 1 CELT
clc,clear,close all
% Datos
frecuencia= [10 25 40 50 60 75 80 100 150 300 500 700 900 1000 2000 4000 5000 8000 10000 15000 20000 25000 35000 50000 75000 100000];
ganancia=[0.04 0.09 0.13 0.16 0.2 0.25 0.26 0.34 0.52 1.1 2 3.5 5.2 5.8 2.2 0.98 0.75 0.47 0.41 0.3 0.24 0.21 0.12 0.08 0.06 0.05];
gananciadB= 20*log10(ganancia);
fase=[272 271.4 270.7 270.3 269.9 269.3 269 268.2 263.1 247.8 227.4 207 186 176.4 166.5 146.8 136.9 107 87.6 87.7 87.7 87.8 88 88.2 88.6 89.4];
R1=1e3;   
R2=12e3;
C=47e-9;
gs = tf([-21276.59574 0],[1 3546.1 37724460.54]);
w= 2*pi*frecuencia;

% Gráfica
figure(1)
bode(gs,{0,100000}),grid

figure(2)
subplot(2,1,1)
semilogx(w,gananciadB),grid,title("Medidas Filtro Paso Banda"),xlabel("Frecuencia(rad/s)"),ylabel("Ganancia(dB)")
subplot(2,1,2)
semilogx(w,fase),grid,xlabel("Frecuencia(rad/s)"),ylabel("Fase(º)")

figure(3)
subplot(2,1,1)
semilogx(frecuencia,gananciadB),grid,title("Medidas Filtro Paso Banda"),xlabel("Frecuencia(Hz)"),ylabel("Ganancia(dB)")
subplot(2,1,2)
semilogx(frecuencia,fase),grid,xlabel("Frecuencia(Hz)"),ylabel("Fase(º)")

% Cálculo de polos y ceros
ceros= roots(gs.num{1})
polos= roots(gs.den{1})
modulo_polos= abs(polos)
