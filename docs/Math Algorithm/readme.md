# Manipulator Kinematics: Forward and Inverse Kinematics in MATLAB

This repository contains MATLAB code for calculating the **forward kinematics** and **inverse kinematics** of a robotic manipulator using symbolic computations. The manipulator consists of multiple links and joints, with both revolute and prismatic types.

---
### 1. **Forward Kinematics**

Forward kinematics is the process of computing the position and orientation of the end-effector given the joint parameters. This is achieved by multiplying the transformation matrices of each joint in sequence.

#### Transformation Matrices
The manipulator is defined with four frames:
- **Base to Frame 1** $(\(T_0^1\))$: Revolute joint, with an angle $\(q\)$.
- **Frame 1 to Frame 2** $(\(T_1^2\))$: Prismatic joint, with a length $\(l_1\)$.
- **Frame 2 to Frame 3** $(\(T_2^3\))$: Prismatic joint, with a length $\(l_2\)$.
- **Frame 3 to End-Effector** $(\(T_3^4\))$: Fixed length $\(l_{ee}\)$.

The end-effector pose $(\(T_{EE}\))$ is computed by multiplying the individual matrices:
\[
$T_{EE} = T_0^1 \cdot T_1^2 \cdot T_2^3 \cdot T_3^4
\]$

#### Output:
- **Position**: Extracted from the \(4^{th}\) column of \(T_{EE}\).
- **Orientation**: Extracted as a \(3 \times 3\) rotation matrix.

### 2. **Inverse Kinematics**

Inverse kinematics involves finding the joint parameters (\(q, l_1, l_2, l_{ee}\)) required to achieve a desired end-effector pose.

#### Steps:
1. Specify the desired **end-effector position** (\(x, y, z\)).
2. Use geometric relationships to compute:
   - \(q\): Angle of the revolute joint using trigonometry.
   - \(l_2\): Extension of the second prismatic joint.
   - \(l_1 + l_{ee}\): Relationship derived from the \(z\)-coordinate.

#### Output:
- **Joint parameters** to achieve the desired pose.

---

## 🔢 Example Output

### Forward Kinematics:
For \(q = \frac{\pi}{4}, l_0 = 1, l_1 = 2, l_2 = 3, l_{ee} = 0.5\):
\[
T_{EE} = \begin{bmatrix} 
0.707 & -0.707 & 0 & 2.12 \\
0.707 & 0.707 & 0 & 2.12 \\
0 & 0 & 1 & 6.50 \\
0 & 0 & 0 & 1 
\end{bmatrix}
\]

### Inverse Kinematics:
Given \(x = 2, y = 2, z = 3\):
- \(q = \arctan\left(\frac{y}{x}\right) = \frac{\pi}{4}\)
- \(l_2 = y / \cos(q) = 2.83\)
- \(l_1 + l_{ee} = z - l_0 = 2.0\)
