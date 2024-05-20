// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to area and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 81.4 %    (Lower is better)
// gates = 50.0
// levels = 18
// area = 70.27    (For MCNC library relative to nand2)
// power = 328.3 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 22.7 ns    (Berkely-ABC for MCNC library)
// PDP = 7.45241e-12 J

// Pin mapping:
// {n0, n1, n2, n3, n4, n5, n6, n7} = A[7:0]
// {n8, n9, n10, n11, n12, n13, n14, n15} = B[7:0]
// {n75, n52, n49, n45, n43, n39, n36, n34, n65} = O[8:0]

module addr8s_area_16 (
n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
n75, n52, n49, n45, n43, n39, n36, n34, n65
);

input n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
output n75, n52, n49, n45, n43, n39, n36, n34, n65;
wire n22, n42, n28, n21, n54, n71, n30, n16, n27, n24, n56, n20, n53, n32, n67, n18, n55, n63, n51, n31, 
n25, n58, n41, n26, n37, n35, n29, n17, n38, n19, n61, n50, n46, n47, n23, n40, n48, n57, n33, n68, 
n44;

nand (n16, n14, n6);
nand (n17, n9, n1);
nand (n18, n13, n5);
nand (n19, n8, n0);
xor (n20, n8, n0);
nand (n21, n10, n2);
xor (n22, n12, n4);
xnor (n23, n15, n7);
xor (n24, n10, n2);
and (n25, n23, n15);
nand (n26, n11, n3);
xor (n27, n14, n6);
xor (n28, n9, n1);
nand (n29, n12, n4);
xor (n30, n13, n5);
xor (n31, n11, n3);
nand (n32, n23, n23);
nand (n33, n27, n25);
xor (n34, n27, n25);
nand (n35, n33, n16);
xor (n36, n30, n35);
nand (n37, n30, n35);
nand (n38, n37, n18);
xor (n39, n22, n38);
nand (n40, n22, n38);
nand (n41, n40, n29);
nand (n42, n31, n41);
xor (n43, n31, n41);
nand (n44, n42, n26);
xor (n45, n24, n44);
nand (n46, n24, n44);
nand (n47, n46, n21);
nand (n48, n28, n47);
xor (n49, n28, n47);
and (n50, n48, n17);
and (n51, n17, n50);
xnor (n52, n20, n51);
nand (n53, n20, n51);
nand (n54, n19, n19);
xnor (n55, n11, n32);
xnor (n56, n55, n55);
xnor (n57, n56, n56);
nand (n58, n23, n57);
nand (n61, n1, n58);
xnor (n63, n61, n57);
and (n65, n58, n32);
xnor (n67, n63, n63);
or (n68, n67, n19);
xor (n71, n54, n53);
nand (n75, n71, n68);

endmodule