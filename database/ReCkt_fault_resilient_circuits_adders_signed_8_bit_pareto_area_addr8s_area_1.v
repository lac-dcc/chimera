// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to area and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 100.0 %    (Lower is better)
// gates = 38.0
// levels = 16
// area = 52.33    (For MCNC library relative to nand2)
// power = 226.3 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 17.8 ns    (Berkely-ABC for MCNC library)
// PDP = 4.02814e-12 J

// Pin mapping:
// {n0, n1, n2, n3, n4, n5, n6, n7} = A[7:0]
// {n8, n9, n10, n11, n12, n13, n14, n15} = B[7:0]
// {n54, n52, n48, n45, n42, n39, n36, n33, n32} = O[8:0]

module addr8s_area_1 (
n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
n54, n52, n48, n45, n42, n39, n36, n33, n32
);

input n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
output n54, n52, n48, n45, n42, n39, n36, n33, n32;
wire n22, n28, n21, n49, n30, n16, n27, n24, n20, n53, n18, n31, n25, n41, n26, n37, n35, n17, n29, n38, 
n19, n34, n43, n50, n46, n47, n23, n40, n44;

nand (n16, n9, n1);
xor (n17, n8, n0);
xor (n18, n12, n4);
nand (n19, n8, n0);
nand (n20, n12, n4);
nor (n21, n15, n7);
nand (n22, n10, n2);
xor (n23, n9, n1);
and (n24, n15, n7);
xor (n25, n14, n6);
nand (n26, n13, n5);
xor (n27, n13, n5);
xor (n28, n10, n2);
xor (n29, n11, n3);
nand (n30, n14, n6);
nand (n31, n11, n3);
nor (n32, n21, n24);
xor (n33, n25, n24);
nand (n34, n25, n24);
nand (n35, n34, n30);
xor (n36, n27, n35);
nand (n37, n27, n35);
nand (n38, n37, n26);
xor (n39, n18, n38);
nand (n40, n18, n38);
nand (n41, n40, n20);
xor (n42, n29, n41);
nand (n43, n29, n41);
nand (n44, n43, n31);
xor (n45, n28, n44);
nand (n46, n28, n44);
nand (n47, n46, n22);
xor (n48, n23, n47);
nand (n49, n23, n47);
nand (n50, n49, n16);
xor (n52, n17, n50);
nand (n53, n17, n52);
nand (n54, n53, n19);

endmodule