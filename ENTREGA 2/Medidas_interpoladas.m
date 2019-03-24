
new_frecuencia= [1000 2000 3000 4000 5000 6000 7000 8000 9000 10000];
frecuencia=[1000 10000];
ganancia=[0.025126 0.01];
gananciadB= 20*log10(ganancia);
fases=[0 0 4.32 5.76 7.2 10.8 18 31.68 43.56 59.4 64.8 81 108 129.6 135 140.4 158.4 162];
fase= -1.*fases;
fase=[162.2 180];
new_fase=interp1(frecuencia,fase,new_frecuencia,'spline')

