// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to power and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 90.3 %    (Lower is better)
// gates = 76.0
// levels = 19
// area = 96.27    (For MCNC library relative to nand2)
// power = 528.1 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 27.8 ns    (Berkely-ABC for MCNC library)
// PDP = 1.46812e-11 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n82, n81, n75, n67, n53, n52, n92, n24} = O[7:0]

module mult4u_power_7 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n82, n81, n75, n67, n53, n52, n92, n24
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n82, n81, n75, n67, n53, n52, n92, n24;
wire n16, n73, n77, n26, n40, n38, n78, n76, n46, n50, n51, n15, n66, n36, n18, n13, n21, n32, n35, n64, 
n57, n65, n33, n10, n17, n70, n61, n19, n58, n68, n74, n44, n20, n62, n60, n28, n59, n80, n27, n79, 
n69, n45, n71, n25, n14, n43, n8, n39, n34, n37, n31, n42, n56, n54, n12, n63, n30, n22, n11, n49, 
n29, n9, n72, n47, n55, n23, n41, n48;

nand (n8, n4, n3);
and (n9, n5, n0);
nand (n10, n6, n1);
nand (n11, n5, n1);
nand (n12, n0, n0);
nand (n13, n6, n2);
nand (n14, n4, n1);
nand (n15, n7, n0);
nand (n16, n7, n1);
nand (n17, n7, n2);
nand (n18, n6, n3);
and (n19, n5, n3);
nand (n20, n6, n0);
nand (n21, n5, n2);
nand (n22, n4, n2);
nand (n23, n4, n0);
and (n24, n7, n3);
xor (n25, n15, n10);
xor (n26, n18, n17);
nand (n27, n15, n10);
nor (n28, n20, n12);
and (n29, n13, n13);
xor (n30, n13, n16);
or (n31, n17, n26);
nand (n32, n8, n8);
and (n33, n0, n0);
nand (n34, n24, n1);
nand (n35, n13, n29);
nand (n36, n33, n33);
nand (n37, n31, n30);
nand (n38, n37, n35);
nand (n39, n34, n37);
nand (n40, n19, n39);
xor (n41, n25, n38);
nand (n42, n25, n38);
xnor (n43, n19, n39);
nand (n44, n21, n41);
nand (n45, n40, n40);
nand (n46, n42, n27);
xor (n47, n21, n41);
xor (n48, n47, n45);
nand (n49, n48, n40);
nor (n50, n46, n36);
xor (n51, n46, n28);
nand (n52, n43, n43);
xor (n53, n32, n48);
xnor (n54, n9, n50);
xor (n55, n51, n11);
nand (n56, n32, n48);
and (n57, n50, n54);
nand (n58, n51, n11);
nand (n59, n49, n44);
nor (n60, n54, n12);
xor (n61, n55, n59);
nand (n62, n55, n59);
nand (n63, n22, n61);
nand (n64, n0, n0);
nand (n65, n62, n58);
xor (n66, n22, n61);
xnor (n67, n66, n56);
xor (n68, n60, n65);
nand (n69, n66, n67);
nor (n70, n64, n65);
xor (n71, n68, n14);
nor (n72, n70, n57);
nand (n73, n68, n14);
nand (n74, n69, n63);
xnor (n75, n71, n74);
xor (n76, n23, n72);
nand (n77, n23, n23);
nand (n78, n71, n74);
nand (n79, n78, n73);
nand (n80, n72, n79);
xnor (n81, n76, n79);
and (n82, n80, n77);
and (n92, n26, n26);

endmodule