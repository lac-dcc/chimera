// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to pdp and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 96.9 %    (Lower is better)
// gates = 40.0
// levels = 15
// area = 55.64    (For MCNC library relative to nand2)
// power = 227.0 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 16.9 ns    (Berkely-ABC for MCNC library)
// PDP = 3.8363e-12 J

// Pin mapping:
// {n0, n1, n2, n3, n4, n5, n6, n7} = A[7:0]
// {n8, n9, n10, n11, n12, n13, n14, n15} = B[7:0]
// {n54, n83, n48, n46, n50, n39, n37, n32, n34} = O[8:0]

module addr8s_pdp_1 (
n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
n54, n83, n48, n46, n50, n39, n37, n32, n34
);

input n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
output n54, n83, n48, n46, n50, n39, n37, n32, n34;
wire n22, n42, n28, n21, n49, n30, n16, n27, n52, n24, n45, n20, n18, n63, n51, n31, n25, n41, n26, n35, 
n29, n17, n38, n19, n43, n47, n23, n40, n36, n33, n44;

nand (n16, n14, n6);
xor (n17, n14, n6);
nand (n18, n11, n3);
nand (n19, n10, n2);
xor (n20, n9, n1);
xor (n21, n13, n5);
nand (n22, n12, n4);
nand (n23, n13, n5);
xor (n24, n11, n3);
nand (n25, n8, n0);
xnor (n26, n15, n7);
xor (n27, n12, n4);
nand (n28, n9, n1);
and (n29, n7, n15);
xor (n30, n10, n2);
xor (n31, n8, n0);
xor (n32, n17, n29);
nand (n33, n17, n29);
nand (n34, n26, n26);
nand (n35, n33, n16);
nand (n36, n21, n35);
xor (n37, n21, n35);
nand (n38, n36, n23);
xor (n39, n27, n38);
nand (n40, n27, n38);
nand (n41, n40, n22);
nand (n42, n24, n41);
xor (n43, n24, n41);
nand (n44, n42, n18);
nand (n45, n30, n44);
xor (n46, n30, n44);
nand (n47, n45, n19);
xor (n48, n20, n47);
nand (n49, n20, n47);
and (n50, n43, n43);
and (n51, n49, n28);
nand (n52, n31, n51);
nand (n54, n52, n25);
and (n63, n31, n31);
xnor (n83, n51, n63);

endmodule