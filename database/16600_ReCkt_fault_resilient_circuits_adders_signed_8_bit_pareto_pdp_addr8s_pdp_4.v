// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to pdp and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 84.9 %    (Lower is better)
// gates = 48.0
// levels = 16
// area = 66.95    (For MCNC library relative to nand2)
// power = 281.3 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 19.2 ns    (Berkely-ABC for MCNC library)
// PDP = 5.40096e-12 J

// Pin mapping:
// {n0, n1, n2, n3, n4, n5, n6, n7} = A[7:0]
// {n8, n9, n10, n11, n12, n13, n14, n15} = B[7:0]
// {n56, n53, n48, n64, n43, n63, n36, n34, n32} = O[8:0]

module addr8s_pdp_4 (
n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
n56, n53, n48, n64, n43, n63, n36, n34, n32
);

input n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
output n56, n53, n48, n64, n43, n63, n36, n34, n32;
wire n22, n42, n28, n21, n54, n49, n30, n16, n27, n52, n24, n45, n20, n18, n51, n31, n39, n25, n58, n41, 
n26, n37, n35, n29, n17, n38, n19, n61, n62, n50, n46, n47, n59, n23, n40, n57, n33, n60, n44;

xor (n16, n14, n6);
xor (n17, n13, n5);
nand (n18, n14, n6);
xor (n19, n9, n1);
xor (n20, n8, n0);
xor (n21, n10, n2);
xor (n22, n12, n4);
nand (n23, n9, n1);
nor (n24, n15, n7);
and (n25, n15, n7);
nand (n26, n11, n3);
nand (n27, n12, n4);
xor (n28, n11, n3);
nand (n29, n10, n2);
nand (n30, n13, n5);
nand (n31, n8, n0);
nor (n32, n24, n25);
nand (n33, n16, n25);
xor (n34, n16, n25);
nand (n35, n33, n18);
xor (n36, n17, n35);
nand (n37, n17, n35);
nand (n38, n37, n30);
nand (n39, n22, n38);
xor (n40, n22, n38);
nand (n41, n39, n27);
nand (n42, n28, n41);
xor (n43, n28, n41);
nand (n44, n42, n26);
nand (n45, n21, n44);
xor (n46, n21, n44);
nand (n47, n45, n29);
xor (n48, n19, n47);
nand (n49, n19, n47);
nand (n50, n49, n23);
and (n51, n49, n23);
nand (n52, n20, n51);
xor (n53, n20, n50);
nand (n54, n52, n31);
or (n56, n54, n54);
xnor (n57, n36, n32);
xnor (n58, n57, n57);
xnor (n59, n58, n58);
nand (n60, n59, n59);
xnor (n61, n60, n60);
xnor (n62, n61, n61);
and (n63, n40, n40);
and (n64, n62, n46);

endmodule