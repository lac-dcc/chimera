// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to power and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 63.7 %    (Lower is better)
// gates = 70.0
// levels = 23
// area = 93.88    (For MCNC library relative to nand2)
// power = 449.7 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 35.3 ns    (Berkely-ABC for MCNC library)
// PDP = 1.58744e-11 J

// Pin mapping:
// {n0, n1, n2, n3, n4, n5, n6, n7} = A[7:0]
// {n8, n9, n10, n11, n12, n13, n14, n15} = B[7:0]
// {n60, n59, n87, n52, n50, n47, n43, n44, n26} = O[8:0]

module addr8u_power_50 (
n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
n60, n59, n87, n52, n50, n47, n43, n44, n26
);

input n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
output n60, n59, n87, n52, n50, n47, n43, n44, n26;
wire n30, n69, n61, n46, n68, n79, n18, n45, n56, n37, n80, n53, n40, n62, n25, n85, n67, n81, n22, n38, 
n39, n57, n70, n19, n34, n76, n29, n72, n35, n55, n24, n63, n75, n49, n74, n17, n65, n42, n51, n82, 
n78, n36, n20, n23, n83, n16, n66, n48, n21, n41, n54, n27, n33, n28, n58, n71, n73, n31, n84, n32, 
n64;

nand (n16, n13, n5);
not (n17, n14);
or (n18, n12, n4);
nand (n19, n10, n2);
nand (n20, n15, n7);
or (n21, n10, n2);
not (n22, n6);
xor (n23, n8, n0);
or (n24, n13, n5);
nand (n25, n14, n6);
xor (n26, n15, n7);
nand (n27, n12, n4);
xor (n28, n11, n3);
nor (n29, n9, n1);
nand (n30, n8, n0);
nand (n31, n9, n1);
nand (n32, n11, n3);
nand (n33, n27, n18);
not (n34, n29);
nand (n35, n16, n24);
nand (n36, n25, n20);
nand (n37, n17, n22);
nand (n38, n19, n21);
nand (n39, n36, n37);
nand (n40, n25, n37);
nand (n41, n31, n34);
nand (n42, n39, n16);
xor (n43, n39, n35);
xor (n44, n40, n20);
nand (n45, n42, n24);
nand (n46, n45, n27);
xor (n47, n45, n33);
and (n48, n46, n18);
nand (n49, n48, n28);
xor (n50, n48, n28);
nand (n51, n49, n32);
xnor (n52, n38, n51);
nand (n53, n21, n51);
nand (n54, n53, n19);
xnor (n55, n54, n41);
nand (n56, n54, n34);
nand (n57, n56, n31);
nand (n58, n57, n23);
xor (n59, n57, n23);
nand (n60, n58, n30);
xnor (n61, n26, n26);
not (n62, n61);
xnor (n63, n55, n55);
xnor (n64, n26, n26);
xnor (n65, n64, n62);
xnor (n66, n65, n64);
xnor (n67, n26, n26);
xnor (n68, n62, n66);
nand (n69, n55, n55);
xnor (n70, n67, n63);
xnor (n71, n67, n65);
xnor (n72, n68, n71);
xnor (n73, n72, n70);
xnor (n74, n68, n73);
nand (n75, n70, n69);
xnor (n76, n72, n61);
xor (n78, n74, n71);
xor (n79, n74, n76);
xor (n80, n66, n73);
xnor (n81, n80, n79);
xnor (n82, n78, n81);
xnor (n83, n63, n82);
xor (n84, n76, n83);
nor (n85, n75, n84);
nor (n87, n85, n69);

endmodule