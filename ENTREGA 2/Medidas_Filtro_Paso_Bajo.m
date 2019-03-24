%% Entrega 2 CELT
clc,clear,close all
% Datos
frecuencia= [1 4 6 8 10 15 25 40 55 75 100 150 250 400 500 600 800 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000];
ganancia=[1 1 1 1 1 1 0.98 0.95 0.92 0.83 0.75 0.55 0.33 0.2 0.15 0.1 0.069 0.0551 0.0354 0.026 0.02 0.018 0.016 0.015 0.012 0.010 0.0096];
gananciadB= 20*log10(ganancia);
fase=[0 0 4.32 5.76 7.2 10.8 18 31.68 43.56 59.4 64.8 81 108 129.6 135 140.4 158.4 162 164.2 166.1 168.1 170 173.6 174 177 178 183];
fase= -1.*fase;
R=1000;   
C=1e-6;

gs = tf([0 1/(R^2*C^2)],[1 2/(R*C) 1/(R^2*C^2)]);
w= 2*pi*frecuencia;

% Gráfica
figure(1)
bode(gs,{0,10000}),grid
figure(2)
subplot(2,1,1)
semilogx(w,gananciadB),grid,title("Medidas Filtro Paso Bajo"),xlabel("Frecuencia(rad/s)"),ylabel("Ganancia(dB)")
subplot(2,1,2)
semilogx(w,fase),grid,xlabel("Frecuencia(rad/s)"),ylabel("Fase(º)")

figure(3)
subplot(2,1,1)
semilogx(frecuencia,gananciadB),grid,title("Medidas Filtro Paso Bajo"),xlabel("Frecuencia(Hz)"),ylabel("Ganancia(dB)")
subplot(2,1,2)
semilogx(frecuencia,fase),grid,xlabel("Frecuencia(Hz)"),ylabel("Fase(º)")

% Cálculo de polos y ceros
ceros= roots(gs.num{1})
polos= roots(gs.den{1})
modulo_polos= abs(polos)