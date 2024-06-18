// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to area and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 97.8 %    (Lower is better)
// gates = 39.0
// levels = 16
// area = 54.31    (For MCNC library relative to nand2)
// power = 229.6 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 21.4 ns    (Berkely-ABC for MCNC library)
// PDP = 4.91344e-12 J

// Pin mapping:
// {n0, n1, n2, n3, n4, n5, n6, n7} = A[7:0]
// {n8, n9, n10, n11, n12, n13, n14, n15} = B[7:0]
// {n54, n53, n49, n45, n42, n40, n37, n32, n34} = O[8:0]

module addr8s_area_0 (
n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
n54, n53, n49, n45, n42, n40, n37, n32, n34
);

input n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
output n54, n53, n49, n45, n42, n40, n37, n32, n34;
wire n22, n28, n21, n30, n16, n27, n52, n24, n20, n18, n51, n31, n39, n25, n41, n26, n35, n17, n29, n38, 
n19, n43, n50, n46, n47, n23, n36, n48, n33, n44;

nand (n16, n8, n0);
xnor (n17, n15, n7);
xor (n18, n14, n6);
and (n19, n15, n17);
nand (n20, n9, n1);
xor (n21, n11, n3);
xor (n22, n10, n2);
nand (n23, n10, n2);
nand (n24, n13, n5);
nand (n25, n11, n3);
xor (n26, n13, n5);
nand (n27, n12, n4);
nand (n28, n14, n6);
xor (n29, n9, n1);
xor (n30, n12, n4);
xor (n31, n8, n0);
xor (n32, n18, n19);
nand (n33, n18, n19);
nand (n34, n17, n17);
nand (n35, n33, n28);
nand (n36, n26, n35);
xor (n37, n26, n35);
nand (n38, n36, n24);
nand (n39, n30, n38);
xor (n40, n30, n38);
nand (n41, n39, n27);
xor (n42, n21, n41);
nand (n43, n21, n41);
nand (n44, n43, n25);
xor (n45, n22, n44);
nand (n46, n22, n44);
nand (n47, n46, n23);
nand (n48, n29, n47);
xor (n49, n29, n47);
and (n50, n48, n20);
or (n51, n50, n50);
nand (n52, n31, n50);
xnor (n53, n31, n51);
nand (n54, n52, n16);

endmodule