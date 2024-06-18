// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to pdp and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 88.5 %    (Lower is better)
// gates = 48.0
// levels = 15
// area = 67.63    (For MCNC library relative to nand2)
// power = 286.3 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 16.8 ns    (Berkely-ABC for MCNC library)
// PDP = 4.80984e-12 J

// Pin mapping:
// {n0, n1, n2, n3, n4, n5, n6, n7} = A[7:0]
// {n8, n9, n10, n11, n12, n13, n14, n15} = B[7:0]
// {n54, n52, n79, n63, n64, n39, n36, n32, n33} = O[8:0]

module addr8s_pdp_37 (
n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
n54, n52, n79, n63, n64, n39, n36, n32, n33
);

input n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
output n54, n52, n79, n63, n64, n39, n36, n32, n33;
wire n22, n42, n28, n21, n49, n30, n16, n27, n24, n45, n56, n20, n53, n18, n55, n51, n31, n25, n58, n41, 
n26, n37, n35, n29, n17, n38, n19, n34, n43, n62, n50, n46, n47, n59, n23, n40, n48, n57, n44;

xor (n16, n14, n6);
xor (n17, n8, n0);
xor (n18, n13, n5);
xor (n19, n10, n2);
nand (n20, n14, n6);
and (n21, n15, n7);
nand (n22, n13, n5);
nand (n23, n12, n4);
xor (n24, n12, n4);
nor (n25, n15, n7);
nand (n26, n9, n1);
nand (n27, n10, n2);
nand (n28, n8, n0);
xor (n29, n11, n3);
nand (n30, n11, n3);
xor (n31, n9, n1);
xor (n32, n16, n21);
nor (n33, n25, n21);
nand (n34, n16, n21);
nand (n35, n34, n20);
xor (n36, n18, n35);
nand (n37, n18, n35);
nand (n38, n37, n22);
xor (n39, n24, n38);
nand (n40, n24, n38);
nand (n41, n40, n23);
xor (n42, n29, n41);
nand (n43, n29, n41);
nand (n44, n43, n30);
nand (n45, n19, n44);
xor (n46, n19, n44);
nand (n47, n45, n27);
xor (n48, n31, n47);
nand (n49, n31, n47);
and (n50, n49, n26);
nand (n51, n49, n26);
xor (n52, n17, n51);
nand (n53, n17, n50);
nand (n54, n53, n28);
xnor (n55, n32, n32);
xor (n56, n32, n32);
xnor (n57, n55, n56);
xnor (n58, n55, n57);
nand (n59, n58, n56);
xor (n62, n59, n58);
and (n63, n46, n46);
and (n64, n42, n42);
and (n79, n62, n48);

endmodule