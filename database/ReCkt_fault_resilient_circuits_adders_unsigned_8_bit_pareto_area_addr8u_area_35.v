// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to area and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 79.4 %    (Lower is better)
// gates = 57.0
// levels = 23
// area = 72.6    (For MCNC library relative to nand2)
// power = 371.0 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 30.5 ns    (Berkely-ABC for MCNC library)
// PDP = 1.13155e-11 J

// Pin mapping:
// {n0, n1, n2, n3, n4, n5, n6, n7} = A[7:0]
// {n8, n9, n10, n11, n12, n13, n14, n15} = B[7:0]
// {n60, n80, n55, n53, n50, n47, n42, n44, n16} = O[8:0]

module addr8u_area_35 (
n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
n60, n80, n55, n53, n50, n47, n42, n44, n16
);

input n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
output n60, n80, n55, n53, n50, n47, n42, n44, n16;
wire n30, n24, n52, n61, n46, n63, n68, n18, n49, n74, n17, n59, n51, n45, n36, n20, n37, n56, n23, n40, 
n48, n62, n66, n21, n25, n41, n54, n67, n27, n33, n28, n58, n22, n38, n39, n57, n71, n73, n31, n19, 
n34, n32, n76, n26, n43, n29, n64, n35;

xor (n16, n15, n7);
nand (n17, n10, n2);
nand (n18, n13, n5);
not (n19, n6);
nand (n20, n8, n0);
nor (n21, n9, n1);
nand (n22, n11, n3);
or (n23, n13, n5);
not (n24, n14);
nand (n25, n12, n4);
nand (n26, n9, n1);
nand (n27, n14, n6);
xor (n28, n8, n0);
nand (n29, n15, n7);
xor (n30, n11, n3);
or (n31, n10, n2);
or (n32, n12, n4);
nand (n33, n24, n19);
nand (n34, n17, n31);
nand (n35, n27, n29);
nand (n36, n18, n23);
not (n37, n21);
nand (n38, n25, n32);
nand (n39, n27, n33);
nand (n40, n35, n33);
nand (n41, n26, n37);
xor (n42, n40, n36);
nand (n43, n40, n18);
xor (n44, n39, n29);
nand (n45, n43, n23);
nand (n46, n45, n25);
xor (n47, n45, n38);
and (n48, n46, n32);
nand (n49, n48, n30);
xor (n50, n48, n30);
nand (n51, n49, n22);
nand (n52, n31, n51);
xnor (n53, n34, n51);
nand (n54, n52, n17);
xnor (n55, n54, n41);
nand (n56, n54, n37);
nand (n57, n56, n26);
nand (n58, n57, n28);
xor (n59, n57, n28);
nand (n60, n58, n20);
xnor (n61, n47, n47);
xnor (n62, n47, n61);
xor (n63, n60, n60);
xnor (n64, n62, n63);
xnor (n66, n63, n64);
xnor (n67, n66, n64);
xnor (n68, n61, n67);
nand (n71, n63, n66);
xnor (n73, n62, n67);
nor (n74, n73, n71);
nand (n76, n74, n68);
and (n80, n59, n76);

endmodule