// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to area and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 90.6 %    (Lower is better)
// gates = 46.0
// levels = 17
// area = 61.29    (For MCNC library relative to nand2)
// power = 252.7 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 20.3 ns    (Berkely-ABC for MCNC library)
// PDP = 5.12981e-12 J

// Pin mapping:
// {n0, n1, n2, n3, n4, n5, n6, n7} = A[7:0]
// {n8, n9, n10, n11, n12, n13, n14, n15} = B[7:0]
// {n60, n58, n62, n52, n49, n47, n42, n43, n25} = O[8:0]

module addr8u_area_19 (
n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
n60, n58, n62, n52, n49, n47, n42, n43, n25
);

input n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
output n60, n58, n62, n52, n49, n47, n42, n43, n25;
wire n30, n24, n46, n18, n17, n59, n51, n45, n36, n20, n37, n56, n23, n16, n53, n40, n48, n21, n41, n54, 
n27, n33, n28, n22, n38, n39, n57, n31, n19, n44, n34, n32, n26, n50, n29, n35, n55;

nand (n16, n8, n0);
xor (n17, n14, n6);
or (n18, n12, n4);
xor (n19, n10, n2);
xnor (n20, n9, n1);
nand (n21, n1, n20);
or (n22, n13, n5);
nand (n23, n11, n3);
nand (n24, n14, n14);
xor (n25, n15, n7);
xor (n26, n13, n5);
xor (n27, n12, n4);
xor (n28, n11, n3);
xor (n29, n8, n0);
nor (n30, n6, n17);
nand (n31, n15, n7);
nand (n32, n10, n2);
nand (n33, n20, n20);
nand (n34, n27, n27);
nand (n35, n19, n19);
nand (n36, n17, n31);
nand (n37, n24, n30);
and (n38, n26, n26);
nand (n39, n36, n37);
nand (n40, n17, n17);
nand (n41, n33, n33);
xnor (n42, n39, n38);
xor (n43, n40, n31);
nand (n44, n42, n26);
nand (n45, n44, n22);
nand (n46, n45, n27);
xor (n47, n45, n34);
and (n48, n46, n18);
xor (n49, n48, n28);
nand (n50, n48, n28);
nand (n51, n50, n23);
xnor (n52, n35, n51);
nand (n53, n19, n51);
nand (n54, n53, n32);
xnor (n55, n54, n41);
nand (n56, n54, n33);
nand (n57, n56, n21);
xor (n58, n57, n29);
nand (n59, n57, n29);
nand (n60, n59, n16);
and (n62, n55, n55);

endmodule