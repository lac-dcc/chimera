// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to area and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 94.7 %    (Lower is better)
// gates = 44.0
// levels = 16
// area = 58.29    (For MCNC library relative to nand2)
// power = 250.8 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 18.1 ns    (Berkely-ABC for MCNC library)
// PDP = 4.53948e-12 J

// Pin mapping:
// {n0, n1, n2, n3, n4, n5, n6, n7} = A[7:0]
// {n8, n9, n10, n11, n12, n13, n14, n15} = B[7:0]
// {n60, n58, n56, n52, n49, n46, n42, n43, n29} = O[8:0]

module addr8u_area_4 (
n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
n60, n58, n56, n52, n49, n46, n42, n43, n29
);

input n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
output n60, n58, n56, n52, n49, n46, n42, n43, n29;
wire n30, n24, n18, n17, n59, n51, n45, n36, n47, n20, n37, n23, n16, n53, n40, n48, n21, n25, n41, n54, 
n27, n33, n28, n38, n39, n57, n31, n19, n44, n34, n32, n26, n50, n35, n55;

xor (n16, n10, n2);
nand (n17, n10, n2);
xor (n18, n14, n6);
or (n19, n12, n4);
nand (n20, n8, n0);
xor (n21, n13, n5);
xor (n23, n8, n0);
nor (n24, n14, n18);
xnor (n25, n9, n1);
nand (n26, n25, n1);
or (n27, n13, n21);
nand (n28, n15, n7);
xor (n29, n15, n7);
nand (n30, n11, n3);
xor (n31, n12, n4);
xor (n32, n11, n3);
not (n33, n31);
nand (n34, n25, n25);
not (n35, n24);
nand (n36, n18, n28);
nand (n37, n16, n16);
and (n38, n21, n21);
nand (n39, n36, n35);
and (n40, n18, n18);
nand (n41, n34, n34);
xnor (n42, n39, n38);
xnor (n43, n40, n28);
nand (n44, n39, n21);
nand (n45, n44, n27);
xor (n46, n45, n33);
nand (n47, n45, n31);
and (n48, n47, n19);
xor (n49, n48, n32);
nand (n50, n48, n32);
nand (n51, n50, n30);
xnor (n52, n37, n51);
nand (n53, n16, n51);
nand (n54, n53, n17);
nand (n55, n54, n34);
xnor (n56, n54, n41);
nand (n57, n55, n26);
xor (n58, n57, n23);
nand (n59, n57, n23);
nand (n60, n59, n20);

endmodule