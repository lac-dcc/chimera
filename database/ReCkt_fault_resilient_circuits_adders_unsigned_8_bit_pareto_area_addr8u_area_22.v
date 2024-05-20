// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to area and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 87.1 %    (Lower is better)
// gates = 53.0
// levels = 15
// area = 64.96    (For MCNC library relative to nand2)
// power = 313.5 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 17.7 ns    (Berkely-ABC for MCNC library)
// PDP = 5.54895e-12 J

// Pin mapping:
// {n0, n1, n2, n3, n4, n5, n6, n7} = A[7:0]
// {n8, n9, n10, n11, n12, n13, n14, n15} = B[7:0]
// {n60, n59, n55, n52, n49, n47, n70, n43, n27} = O[8:0]

module addr8u_area_22 (
n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
n60, n59, n55, n52, n49, n47, n70, n43, n27
);

input n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
output n60, n59, n55, n52, n49, n47, n70, n43, n27;
wire n30, n24, n61, n46, n63, n18, n17, n65, n42, n51, n45, n36, n20, n37, n56, n23, n16, n53, n40, n48, 
n62, n66, n21, n25, n41, n54, n67, n33, n28, n58, n22, n38, n39, n57, n31, n19, n44, n34, n32, n26, 
n50, n29, n64, n35;

nand (n16, n8, n0);
nand (n17, n15, n7);
nand (n18, n9, n1);
nand (n19, n10, n2);
or (n20, n13, n5);
nand (n21, n14, n6);
nor (n22, n9, n1);
or (n23, n10, n2);
xor (n24, n11, n3);
xor (n25, n8, n0);
nand (n26, n12, n4);
xor (n27, n15, n7);
nand (n28, n11, n3);
nand (n29, n13, n5);
not (n30, n14);
not (n31, n6);
or (n32, n12, n4);
nand (n33, n19, n23);
not (n34, n22);
nand (n35, n29, n20);
nand (n36, n21, n17);
nand (n37, n26, n32);
nand (n38, n30, n31);
nand (n39, n21, n38);
nand (n40, n18, n34);
nand (n41, n36, n38);
xor (n42, n41, n35);
xor (n43, n39, n17);
nand (n44, n41, n29);
nand (n45, n44, n20);
nand (n46, n45, n26);
xor (n47, n45, n37);
and (n48, n46, n32);
xor (n49, n48, n24);
nand (n50, n48, n24);
nand (n51, n50, n28);
xnor (n52, n33, n51);
nand (n53, n23, n51);
nand (n54, n53, n19);
xnor (n55, n54, n40);
nand (n56, n54, n34);
nand (n57, n56, n18);
nand (n58, n57, n25);
xor (n59, n57, n25);
nand (n60, n58, n16);
and (n61, n42, n42);
xnor (n62, n61, n61);
xnor (n63, n62, n62);
nor (n64, n63, n63);
nand (n65, n42, n42);
xnor (n66, n64, n64);
nor (n67, n42, n66);
nor (n70, n67, n65);

endmodule