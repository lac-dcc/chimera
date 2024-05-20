// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to pdp and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 92.9 %    (Lower is better)
// gates = 44.0
// levels = 15
// area = 58.96    (For MCNC library relative to nand2)
// power = 245.8 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 16.8 ns    (Berkely-ABC for MCNC library)
// PDP = 4.12944e-12 J

// Pin mapping:
// {n0, n1, n2, n3, n4, n5, n6, n7} = A[7:0]
// {n8, n9, n10, n11, n12, n13, n14, n15} = B[7:0]
// {n60, n58, n55, n52, n49, n47, n44, n42, n17} = O[8:0]

module addr8u_pdp_1 (
n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
n60, n58, n55, n52, n49, n47, n44, n42, n17
);

input n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
output n60, n58, n55, n52, n49, n47, n44, n42, n17;
wire n30, n24, n46, n18, n59, n51, n45, n36, n20, n37, n56, n23, n16, n53, n40, n48, n21, n41, n54, n27, 
n33, n28, n22, n38, n39, n57, n31, n19, n34, n32, n26, n50, n43, n29, n35;

nand (n16, n8, n0);
xor (n17, n15, n7);
nor (n18, n6, n14);
nand (n19, n9, n1);
nand (n20, n10, n2);
xor (n21, n13, n5);
xor (n22, n14, n6);
nand (n23, n11, n3);
or (n24, n12, n4);
nand (n26, n15, n7);
or (n27, n13, n21);
xor (n28, n12, n4);
xor (n29, n11, n3);
xnor (n30, n9, n1);
xor (n31, n10, n2);
xor (n32, n8, n0);
or (n33, n28, n28);
nand (n34, n18, n18);
nand (n35, n22, n26);
nand (n36, n31, n31);
nand (n37, n30, n30);
nand (n38, n21, n21);
nand (n39, n22, n22);
nand (n40, n37, n37);
nand (n41, n35, n34);
xor (n42, n39, n26);
nand (n43, n41, n21);
xor (n44, n41, n38);
nand (n45, n43, n27);
nand (n46, n45, n28);
xnor (n47, n45, n33);
and (n48, n46, n24);
xor (n49, n48, n29);
nand (n50, n48, n29);
nand (n51, n50, n23);
xnor (n52, n36, n51);
nand (n53, n31, n51);
nand (n54, n53, n20);
xnor (n55, n54, n40);
nand (n56, n54, n37);
nand (n57, n56, n19);
xor (n58, n57, n32);
nand (n59, n57, n32);
nand (n60, n59, n16);

endmodule