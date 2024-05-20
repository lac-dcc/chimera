// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to pdp and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 71.8 %    (Lower is better)
// gates = 61.0
// levels = 18
// area = 83.54    (For MCNC library relative to nand2)
// power = 390.5 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 21.6 ns    (Berkely-ABC for MCNC library)
// PDP = 8.4348e-12 J

// Pin mapping:
// {n0, n1, n2, n3, n4, n5, n6, n7} = A[7:0]
// {n8, n9, n10, n11, n12, n13, n14, n15} = B[7:0]
// {n73, n59, n55, n53, n49, n81, n44, n43, n71} = O[8:0]

module addr8u_pdp_12 (
n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
n73, n59, n55, n53, n49, n81, n44, n43, n71
);

input n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
output n73, n59, n55, n53, n49, n81, n44, n43, n71;
wire n30, n24, n52, n61, n46, n63, n68, n69, n18, n74, n60, n17, n65, n42, n51, n45, n78, n36, n47, n20, 
n37, n56, n23, n16, n40, n48, n62, n66, n21, n25, n41, n54, n67, n27, n33, n28, n58, n22, n38, n39, 
n57, n31, n70, n19, n34, n32, n76, n26, n50, n29, n64, n35;

xor (n16, n14, n6);
nand (n17, n10, n2);
nand (n18, n15, n7);
xor (n19, n13, n5);
nand (n20, n9, n1);
xor (n21, n8, n0);
nand (n22, n14, n14);
xor (n23, n11, n3);
xnor (n24, n15, n7);
xor (n25, n10, n2);
or (n26, n13, n19);
xor (n27, n12, n4);
nand (n28, n8, n0);
nand (n29, n11, n3);
nand (n30, n6, n6);
xnor (n31, n9, n1);
or (n32, n27, n12);
nand (n33, n27, n27);
nand (n34, n16, n18);
and (n35, n19, n19);
nand (n36, n22, n30);
nand (n37, n25, n25);
nand (n38, n31, n31);
nand (n39, n38, n38);
and (n40, n16, n16);
nand (n41, n34, n36);
nand (n42, n41, n19);
xnor (n43, n40, n18);
xnor (n44, n41, n35);
nand (n45, n42, n26);
xor (n46, n45, n33);
nand (n47, n46, n27);
and (n48, n47, n32);
xor (n49, n48, n23);
nand (n50, n48, n23);
nand (n51, n50, n29);
nand (n52, n25, n51);
xnor (n53, n37, n51);
nand (n54, n52, n17);
xnor (n55, n54, n39);
nand (n56, n54, n38);
nand (n57, n56, n20);
nand (n58, n57, n21);
xor (n59, n57, n21);
and (n60, n28, n28);
xnor (n61, n60, n0);
xnor (n62, n0, n0);
xnor (n63, n10, n62);
nand (n64, n60, n28);
xnor (n65, n63, n1);
xor (n66, n58, n21);
xnor (n67, n65, n61);
xnor (n68, n61, n62);
xnor (n69, n65, n46);
nand (n70, n66, n64);
nand (n71, n24, n24);
nand (n73, n70, n58);
xnor (n74, n69, n67);
xnor (n76, n74, n68);
or (n78, n46, n76);
and (n81, n46, n78);

endmodule