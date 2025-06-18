import numpy as np
import matplotlib.pyplot as plt

# Optional: Set global font family
plt.rcParams['font.family'] = 'Cambria'

# Load data
data = np.loadtxt('ss_curve.txt')
strain = data[:, 0]
stress = data[:, 1]

# Create plot
plt.figure(figsize=(8, 6))
plt.plot(strain, stress, color='#1f77b4', linewidth=2, label='Sample 01')

# Labels and title with bold styling
plt.title('Stress–Strain Curve', fontsize=16, fontweight='bold', pad=15)
plt.xlabel('Strain', fontsize=14, fontweight='bold', labelpad=10)
plt.ylabel('Stress (GPa)', fontsize=14, fontweight='bold', labelpad=10)

# Grid and ticks
plt.grid(True, linestyle='--', linewidth=0.5, alpha=0.5)
plt.xticks(fontsize=13)
plt.yticks(fontsize=13)
plt.tick_params(direction='in', length=6, width=1.1)

# Spine style
for spine in ['left', 'bottom', 'top', 'right']:
    plt.gca().spines[spine].set_linewidth(1.1)

# Optional legend
plt.legend(frameon=False, fontsize=13)

# Save and show
plt.tight_layout()
plt.savefig('ss_curve.png', dpi=1200, bbox_inches='tight', facecolor='white')
plt.show()
