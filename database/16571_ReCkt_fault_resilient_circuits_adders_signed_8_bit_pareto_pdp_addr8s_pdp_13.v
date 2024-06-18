// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to pdp and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 72.1 %    (Lower is better)
// gates = 58.0
// levels = 17
// area = 82.56    (For MCNC library relative to nand2)
// power = 431.3 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 18.8 ns    (Berkely-ABC for MCNC library)
// PDP = 8.10844e-12 J

// Pin mapping:
// {n0, n1, n2, n3, n4, n5, n6, n7} = A[7:0]
// {n8, n9, n10, n11, n12, n13, n14, n15} = B[7:0]
// {n72, n52, n49, n45, n66, n40, n37, n33, n73} = O[8:0]

module addr8s_pdp_13 (
n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
n72, n52, n49, n45, n66, n40, n37, n33, n73
);

input n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
output n72, n52, n49, n45, n66, n40, n37, n33, n73;
wire n22, n42, n28, n21, n54, n71, n30, n16, n27, n24, n56, n20, n53, n32, n64, n18, n67, n55, n63, n51, 
n70, n31, n39, n25, n58, n41, n26, n35, n29, n17, n38, n19, n34, n43, n61, n62, n65, n50, n69, n46, 
n47, n59, n23, n36, n48, n57, n60, n68, n44;

xor (n16, n9, n1);
xor (n17, n10, n2);
xor (n18, n8, n0);
nand (n19, n14, n6);
nand (n20, n10, n2);
nand (n21, n13, n5);
and (n22, n15, n7);
nor (n23, n15, n7);
xor (n24, n13, n5);
xor (n25, n14, n6);
nand (n26, n12, n4);
xor (n27, n11, n3);
xor (n28, n12, n4);
nand (n29, n11, n3);
nand (n30, n9, n1);
nand (n31, n8, n0);
nand (n32, n25, n22);
xor (n33, n25, n22);
nor (n34, n23, n22);
nand (n35, n32, n19);
nand (n36, n24, n35);
xor (n37, n24, n35);
nand (n38, n36, n21);
nand (n39, n28, n38);
xor (n40, n28, n38);
nand (n41, n39, n26);
nand (n42, n27, n41);
xor (n43, n27, n41);
nand (n44, n42, n29);
xor (n45, n17, n44);
nand (n46, n17, n44);
nand (n47, n46, n20);
nand (n48, n16, n47);
xor (n49, n16, n47);
and (n50, n48, n30);
nand (n51, n48, n30);
xor (n52, n18, n51);
nand (n53, n18, n50);
nand (n54, n53, n31);
xnor (n55, n33, n33);
xnor (n56, n33, n33);
nand (n57, n54, n54);
xnor (n58, n33, n33);
xnor (n59, n33, n58);
nand (n60, n55, n56);
xnor (n61, n33, n58);
xnor (n62, n60, n55);
xnor (n63, n59, n61);
xnor (n64, n63, n62);
xnor (n65, n43, n64);
xnor (n66, n64, n65);
xnor (n67, n60, n62);
xnor (n68, n61, n63);
xnor (n69, n56, n59);
xnor (n70, n69, n68);
or (n71, n67, n70);
nand (n72, n57, n71);
and (n73, n71, n34);

endmodule