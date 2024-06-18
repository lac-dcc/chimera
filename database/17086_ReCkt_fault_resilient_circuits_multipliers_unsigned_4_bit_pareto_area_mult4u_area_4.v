// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to area and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 95.0 %    (Lower is better)
// gates = 72.0
// levels = 16
// area = 90.62    (For MCNC library relative to nand2)
// power = 517.3 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 21.4 ns    (Berkely-ABC for MCNC library)
// PDP = 1.10702e-11 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n82, n81, n77, n68, n56, n51, n31, n13} = O[7:0]

module mult4u_area_4 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n82, n81, n77, n68, n56, n51, n31, n13
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n82, n81, n77, n68, n56, n51, n31, n13;
wire n16, n73, n40, n38, n78, n76, n46, n50, n15, n66, n36, n67, n18, n21, n32, n35, n64, n57, n33, n10, 
n17, n70, n61, n19, n58, n24, n74, n44, n20, n62, n60, n28, n59, n80, n79, n69, n45, n71, n25, n14, 
n43, n8, n75, n39, n34, n37, n42, n52, n54, n12, n63, n30, n22, n11, n49, n29, n9, n72, n47, n55, 
n53, n23, n41, n48;

nand (n8, n5, n1);
nand (n9, n0, n0);
nand (n10, n6, n2);
nand (n11, n7, n1);
nand (n12, n4, n1);
and (n13, n7, n3);
nand (n14, n4, n3);
nand (n15, n7, n0);
nand (n16, n5, n2);
nand (n17, n4, n2);
nand (n18, n4, n0);
nand (n19, n6, n1);
and (n20, n5, n3);
nand (n21, n6, n3);
nand (n22, n0, n6);
and (n23, n5, n0);
nand (n24, n7, n2);
nand (n25, n15, n19);
xor (n28, n10, n11);
not (n29, n14);
xor (n30, n15, n19);
xor (n31, n21, n24);
nor (n32, n22, n9);
nand (n33, n0, n0);
nand (n34, n10, n10);
not (n35, n13);
nand (n36, n13, n1);
nand (n37, n35, n28);
nand (n38, n36, n37);
nand (n39, n37, n34);
nand (n40, n20, n38);
xnor (n41, n20, n38);
xor (n42, n30, n39);
nand (n43, n30, n39);
nand (n44, n43, n25);
nand (n45, n16, n42);
not (n46, n40);
xor (n47, n16, n42);
nand (n48, n47, n40);
xor (n49, n47, n46);
nor (n50, n44, n33);
nor (n51, n41, n46);
xor (n52, n44, n32);
and (n53, n50, n5);
xor (n54, n52, n8);
nand (n55, n52, n8);
xor (n56, n29, n49);
nand (n57, n29, n49);
nand (n58, n48, n45);
xnor (n59, n23, n50);
nand (n60, n54, n58);
xor (n61, n54, n58);
nor (n62, n59, n9);
xor (n63, n17, n61);
nand (n64, n60, n55);
nand (n66, n17, n60);
nand (n67, n63, n57);
xnor (n68, n63, n57);
xor (n69, n62, n64);
nor (n70, n59, n64);
xor (n71, n69, n12);
nand (n72, n67, n66);
xnor (n73, n70, n53);
nand (n74, n69, n12);
xor (n75, n18, n73);
nand (n76, n18, n18);
xnor (n77, n71, n72);
nand (n78, n71, n72);
nand (n79, n78, n74);
nand (n80, n73, n79);
xnor (n81, n75, n79);
and (n82, n80, n76);

endmodule