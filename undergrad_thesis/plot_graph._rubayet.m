% Graph from Rubayet vai
clear all;
clc;  
data = dlmread('result.txt', ' ', 1, 0); % Read data from the LAMMPS text file, skipping the header line

% Extract stress and strain values
strain = data(:, 1);
stress = data(:, 2);

% Plot stress-strain curve
plot(strain, stress, 'LineWidth', 2);
xlabel('Strain(($\AA/\AA$)','Interpreter','latex','Fontname','TimesNewRoman');
ylabel('Stress(GPa)','Interpreter','latex','Fontname','TimesNewRoman');
title('Stress-Strain Curve');
grid on;

% Set the y-axis limits
ylim([0, max(stress+.5)]);  % Set the lower limit to 0 and upper limit to the maximum stress
xlim([0,.5]);
% Find the linear elastic region
linear_range_start = 0.00; % Adjust the starting point of the linear range
linear_range_end = 0.035;   % Adjust the ending point of the linear range

% Find the corresponding indices for the linear range
linear_range_indices = find(strain >= linear_range_start & strain <= linear_range_end);
linear_strain = strain(linear_range_indices);
linear_stress = stress(linear_range_indices);

% Calculate the slope (Young's modulus) using linear regression
linear_coeffs = polyfit(linear_strain, linear_stress, 1);
young_modulus = linear_coeffs(1);

% Print Young's modulus
fprintf('Young''s modulus: %.2f GPa\n', young_modulus);

% Find the ultimate strength
ultimate_strength = max(stress);

% Print the ultimate strength
fprintf('Ultimate strength: %.2f GPa\n', ultimate_strength);

% Plot the linear elastic region and ultimate strength point
hold on;
plot(linear_strain, polyval(linear_coeffs, linear_strain), 'r--', 'LineWidth', 2);
plot(strain(stress == ultimate_strength), ultimate_strength, 'ko', 'MarkerSize', 8);
legend('Stress-Strain Curve', 'Linear Elastic Region', 'Ultimate Strength');
hold off;
