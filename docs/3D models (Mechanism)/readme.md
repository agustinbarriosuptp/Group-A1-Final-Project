# 3D Models (Mechanism)

This folder contains the **3D CAD models** and related files for the mechanical components of our **Robotics Project**. These models are essential for visualizing, designing, and assembling the custom robotic arm and the additional components for the EPSON robot tasks.

## 📁 Contents
- **CAD Files (.STEP, .SLDPRT):** 3D models of robotic parts, including links, joints, and end effectors.
- **Assembly Files (.SLDASM):** Complete assemblies of the robotic arm and any related mechanisms.
- **Exploded Views:** Illustrations showing the parts in detail for assembly purposes.

---

### 📏 Dimensions, Payload, and Tolerances

This section outlines the key specifications of the robotic arm, including its dimensions, payload capacity, and design tolerances.

#### **1. Dimensions**
For detailed dimensions and measurements of the robotic arm, refer to the following link:  
[📐 View Dimensions Here](https://github.com/agustinbarriosuptp/Group-A1-Final-Project/tree/main/docs/3D%20models%20(Mechanism)/Drawings)  

#### **2. Payload**
- **Minimum Payload:** _8 kg_  
- **Maximum Payload:** _28 kg_  

#### **3. Tolerances**
- **Angular Tolerance:** _Full spin of 360°_  
- **Material Tolerances:**  

  **Aluminum Alloy (e.g., 6061-T6)**  
  - Machined Components: ±0.05 mm to ±0.1 mm  
  - Extruded Components: ±0.2 mm  
  - Welded Components: ±0.5 mm  

  **Steel (e.g., Carbon or Stainless Steel)**  
  - Machined Components: ±0.02 mm to ±0.05 mm  
  - Welded Components: ±0.5 mm  
  - Rolled/Stamped Components: ±0.1 mm to ±0.3 mm  

  **Carbon Fiber (CFRP)**  
  - Precision Molding: ±0.2 mm to ±0.3 mm  
  - Hand-Layup/Manual Process: ±0.5 mm or higher  
  - CNC Machining Post-Cure: ±0.05 mm to ±0.1 mm  

---

### 📏 Workspace

The robotic arm's workspace is primarily determined by its vertical and horizontal reach. Given that the arm is **2 meters tall** and the **orthogonal arm is 2 meters long**, the workspace can be approximated as a **cylindrical** volume.

#### **1. Vertical Reach (Height):**
- The arm's vertical reach is **2 meters**, which defines the maximum height the arm can operate at.

#### **2. Horizontal Reach (Radius):**
- The orthogonal arm provides a **2-meter horizontal reach** from the base.

#### **3. Approximate Workspace:**
The workspace volume is approximately **25.13 m³**, and the arm covers a **12.57 m²** area on the ground.

#### **4. Key Considerations:**
- **Obstacles:** The actual workspace volume and area may be reduced depending on any obstacles or constraints (e.g., walls, supports).
- **End-Effector Reach:** If the end-effector design adds length, the workspace radius will increase accordingly.

---

### 🛠️ Materials Used for the Robotic Arm (8–28 kg Payload)

The materials chosen for our robotic arm are carefully selected to balance strength, weight, and durability, ensuring optimal performance for handling payloads ranging from 8 to 28 kg. Below is an explanation of the materials and their specific roles in the design:

1. **Aluminum Alloy (e.g., 6061-T6):**  
   The primary structure of the robotic arm is made of aluminum alloy. This material offers an excellent strength-to-weight ratio, making it lightweight yet strong enough to handle the required payload. Additionally, aluminum is corrosion-resistant and cost-effective, making it ideal for the main body and linkages of the arm.

2. **Steel (e.g., Carbon or Stainless Steel):**  
   Steel is used in high-stress areas such as the base and critical joints. Its high strength and durability provide stability when operating at maximum payload. Using steel for these components ensures the robotic arm can handle the dynamic forces and stresses during operation.

3. **Carbon Fiber (Optional for Lightweight Sections):**  
   For components like the upper arm or end-effector, carbon fiber is an excellent choice due to its exceptional strength-to-weight ratio. It helps reduce inertia, improving the arm's responsiveness and precision during dynamic movements.

---

#### **Material Benefits:**
- **Aluminum Alloy:** Provides lightweight yet sturdy construction for the arm’s structure, minimizing the load on actuators.  
- **Steel:** Adds durability and ensures the arm remains stable and reliable under heavier loads.  
- **Carbon Fiber:** Enhances performance by reducing the overall weight of moving parts, especially for dynamic applications.

#### **Design Considerations:**
- **Factor of Safety (FoS):** The design incorporates an FoS of 1.5–2.0 to handle unexpected loads or forces during operation.  
- **Actuator Compatibility:** Materials are chosen to align with the torque and motor capabilities required to lift the heaviest payloads.  

By combining these materials strategically, the robotic arm achieves the desired balance of performance, efficiency, and durability.
