// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to area and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 90.4 %    (Lower is better)
// gates = 74.0
// levels = 16
// area = 93.27    (For MCNC library relative to nand2)
// power = 533.5 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 21.4 ns    (Berkely-ABC for MCNC library)
// PDP = 1.14169e-11 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n82, n81, n75, n68, n57, n52, n31, n17} = O[7:0]

module mult4u_area_2 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n82, n81, n75, n68, n57, n52, n31, n17
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n82, n81, n75, n68, n57, n52, n31, n17;
wire n16, n73, n77, n26, n40, n38, n78, n76, n46, n50, n51, n15, n66, n36, n67, n18, n13, n21, n32, n35, 
n64, n65, n33, n10, n70, n61, n19, n58, n24, n74, n44, n20, n62, n60, n28, n59, n80, n27, n79, n69, 
n45, n71, n25, n14, n43, n8, n39, n34, n37, n42, n56, n54, n12, n63, n22, n11, n49, n29, n9, n72, 
n47, n55, n53, n23, n41, n48;

nand (n8, n6, n2);
and (n9, n5, n3);
nand (n10, n4, n1);
nand (n11, n4, n3);
nand (n12, n6, n0);
nand (n13, n7, n0);
nand (n14, n6, n3);
nand (n15, n7, n2);
nand (n16, n2, n4);
and (n17, n7, n3);
nand (n18, n5, n1);
and (n19, n0, n5);
nand (n20, n7, n1);
nand (n21, n5, n2);
nand (n22, n0, n6);
nand (n23, n4, n0);
nand (n24, n6, n1);
xor (n25, n13, n24);
nor (n26, n22, n12);
nand (n27, n11, n11);
nand (n28, n13, n24);
and (n29, n8, n8);
xor (n31, n14, n15);
xor (n32, n8, n20);
nand (n33, n17, n1);
nand (n34, n17, n17);
nand (n35, n0, n0);
nand (n36, n8, n29);
nand (n37, n34, n32);
nand (n38, n33, n37);
nand (n39, n37, n36);
nand (n40, n9, n38);
xnor (n41, n9, n38);
xor (n42, n25, n39);
nand (n43, n25, n39);
nand (n44, n21, n42);
and (n45, n40, n40);
nand (n46, n43, n28);
xor (n47, n21, n42);
xor (n48, n46, n26);
nand (n49, n47, n40);
xnor (n50, n47, n45);
nor (n51, n46, n12);
nand (n52, n41, n41);
nand (n53, n49, n44);
nand (n54, n27, n50);
and (n55, n51, n19);
xor (n56, n48, n18);
xor (n57, n27, n50);
nand (n58, n48, n18);
xnor (n59, n19, n51);
nand (n60, n56, n53);
nor (n61, n59, n35);
xor (n62, n56, n53);
xor (n63, n16, n62);
nand (n64, n60, n58);
nand (n65, n16, n60);
nand (n66, n0, n0);
xor (n67, n61, n64);
xnor (n68, n63, n54);
nor (n69, n66, n64);
nand (n70, n63, n54);
nand (n71, n70, n65);
nor (n72, n69, n55);
nand (n73, n67, n10);
xor (n74, n67, n10);
xnor (n75, n74, n71);
xor (n76, n23, n72);
nand (n77, n23, n23);
nand (n78, n74, n71);
nand (n79, n78, n73);
nand (n80, n76, n79);
xnor (n81, n76, n79);
and (n82, n80, n77);

endmodule