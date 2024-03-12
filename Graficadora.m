% Entradas del sistema
Gp = tf([1], [1 2]);  % Planta del sistema
maxOvershoot = 0.1;   % Porcentaje (10%)
settlingTime = 2;     % Tiempo de estabilización en segundos

% Cálculos de ángulos, factor de amortiguamiento y frecuencia natural
wn = 4 / (settlingTime * maxOvershoot);
zeta = sqrt(1 - (log(maxOvershoot) / pi)^2);
theta = acos(zeta);

% Graficar en el lugar de las raíces
figure;
rlocus(Gp);
sgrid(zeta, wn);
hold on;

% Selección de Punto de Operación Deseado
desiredPoint = input('Ingrese las coordenadas del punto deseado: ');
angle_out = angle(evalfr(Gp, desiredPoint));

% Calcular el ángulo por compensar
angle_compensate = pi - angle_out;

% Mostrar el punto deseado en el lugar de las raíces
plot(real(desiredPoint), imag(desiredPoint), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
legend('Lugar de las Raíces', 'Punto Deseado');
xlabel('Parte Real');
ylabel('Parte Imaginaria');