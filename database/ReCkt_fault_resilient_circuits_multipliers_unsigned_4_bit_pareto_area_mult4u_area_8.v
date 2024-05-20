// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to area and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 91.2 %    (Lower is better)
// gates = 73.0
// levels = 17
// area = 91.95    (For MCNC library relative to nand2)
// power = 527.7 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 21.9 ns    (Berkely-ABC for MCNC library)
// PDP = 1.15566e-11 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n82, n80, n75, n69, n56, n51, n31, n20} = O[7:0]

module mult4u_area_8 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n82, n80, n75, n69, n56, n51, n31, n20
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n82, n80, n75, n69, n56, n51, n31, n20;
wire n16, n73, n77, n26, n40, n38, n78, n76, n46, n50, n15, n66, n36, n67, n18, n13, n21, n32, n35, n57, 
n65, n33, n10, n17, n70, n61, n19, n58, n81, n68, n24, n74, n44, n62, n60, n28, n59, n79, n45, n71, 
n25, n14, n43, n8, n39, n34, n37, n42, n52, n54, n12, n63, n30, n22, n11, n49, n29, n9, n72, n47, 
n55, n53, n23, n41, n48;

and (n8, n5, n0);
nand (n9, n4, n2);
nand (n10, n6, n1);
nand (n11, n4, n0);
nand (n12, n5, n1);
nand (n13, n1, n7);
nand (n14, n5, n2);
nand (n15, n0, n6);
nand (n16, n6, n0);
and (n17, n5, n3);
nand (n18, n4, n1);
nand (n19, n7, n2);
and (n20, n7, n3);
nand (n21, n7, n0);
nand (n22, n6, n3);
nand (n23, n6, n2);
nand (n24, n4, n3);
nand (n25, n21, n10);
nor (n26, n22, n19);
xor (n28, n23, n13);
nand (n29, n24, n24);
nor (n30, n16, n15);
xor (n31, n22, n19);
xor (n32, n21, n10);
nand (n33, n0, n0);
nand (n34, n20, n1);
nand (n35, n23, n23);
nand (n36, n20, n26);
nand (n37, n36, n28);
nand (n38, n34, n37);
nand (n39, n37, n35);
xnor (n40, n17, n38);
nand (n41, n32, n39);
xor (n42, n32, n39);
nand (n43, n17, n40);
nand (n44, n41, n25);
xor (n45, n14, n42);
nand (n46, n43, n43);
nand (n47, n14, n41);
xor (n48, n44, n30);
nand (n49, n45, n43);
nor (n50, n44, n15);
nand (n51, n40, n40);
xor (n52, n45, n46);
nand (n53, n29, n52);
nand (n54, n48, n12);
nand (n55, n49, n47);
xor (n56, n29, n52);
and (n57, n50, n8);
xnor (n58, n8, n50);
xor (n59, n48, n12);
xor (n60, n59, n55);
nand (n61, n59, n55);
nor (n62, n58, n33);
xor (n63, n9, n60);
nand (n65, n9, n60);
nand (n66, n61, n54);
xor (n67, n62, n66);
nand (n68, n63, n53);
xnor (n69, n63, n53);
nor (n70, n33, n66);
nand (n71, n67, n18);
xor (n72, n67, n18);
nand (n73, n68, n65);
nor (n74, n70, n57);
xnor (n75, n72, n73);
xor (n76, n11, n74);
nand (n77, n72, n73);
nand (n78, n11, n11);
nand (n79, n77, n71);
xnor (n80, n76, n79);
nand (n81, n74, n79);
and (n82, n81, n78);

endmodule