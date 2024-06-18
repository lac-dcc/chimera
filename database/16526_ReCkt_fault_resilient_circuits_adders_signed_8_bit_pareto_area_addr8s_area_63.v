// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to area and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 59.0 %    (Lower is better)
// gates = 66.0
// levels = 15
// area = 96.5    (For MCNC library relative to nand2)
// power = 627.6 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 28.1 ns    (Berkely-ABC for MCNC library)
// PDP = 1.76356e-11 J

// Pin mapping:
// {n0, n1, n2, n3, n4, n5, n6, n7} = A[7:0]
// {n8, n9, n10, n11, n12, n13, n14, n15} = B[7:0]
// {n54, n80, n48, n45, n42, n82, n37, n34, n32} = O[8:0]

module addr8s_area_63 (
n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
n54, n80, n48, n45, n42, n82, n37, n34, n32
);

input n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
output n54, n80, n48, n45, n42, n82, n37, n34, n32;
wire n22, n28, n72, n49, n30, n24, n66, n20, n64, n18, n51, n70, n39, n58, n76, n29, n78, n17, n38, n65, 
n61, n47, n23, n36, n33, n73, n68, n21, n71, n16, n27, n52, n56, n53, n67, n55, n79, n63, n31, n25, 
n75, n41, n26, n35, n19, n43, n62, n50, n69, n46, n59, n40, n81, n57, n60, n77, n44;

nand (n16, n10, n2);
nand (n17, n11, n3);
nor (n18, n15, n7);
nand (n19, n13, n5);
xor (n20, n13, n5);
xor (n21, n10, n2);
xor (n22, n14, n6);
nand (n23, n8, n0);
and (n24, n15, n7);
xor (n25, n8, n0);
xor (n26, n11, n3);
nand (n27, n14, n6);
nand (n28, n9, n1);
xor (n29, n9, n1);
xor (n30, n12, n4);
nand (n31, n12, n4);
nor (n32, n18, n24);
nand (n33, n22, n24);
xor (n34, n22, n24);
nand (n35, n33, n27);
nand (n36, n20, n35);
xor (n37, n20, n35);
nand (n38, n36, n19);
xor (n39, n30, n38);
nand (n40, n30, n38);
nand (n41, n40, n31);
xor (n42, n26, n41);
nand (n43, n26, n41);
nand (n44, n43, n17);
xor (n45, n21, n44);
nand (n46, n21, n44);
nand (n47, n46, n16);
xor (n48, n29, n47);
nand (n49, n29, n47);
and (n50, n49, n28);
nand (n51, n49, n28);
nand (n52, n25, n50);
xor (n53, n25, n51);
nand (n54, n52, n23);
xnor (n55, n32, n32);
xnor (n56, n32, n32);
xnor (n57, n32, n32);
xnor (n58, n32, n32);
xnor (n59, n55, n55);
xnor (n60, n32, n57);
xnor (n61, n32, n60);
xnor (n62, n60, n58);
xnor (n63, n58, n59);
xnor (n64, n56, n59);
xnor (n65, n61, n62);
xnor (n66, n64, n56);
xnor (n67, n66, n62);
xnor (n68, n65, n67);
xnor (n69, n64, n68);
xnor (n70, n69, n57);
xnor (n71, n67, n65);
xnor (n72, n70, n61);
xnor (n73, n69, n68);
xnor (n75, n63, n63);
xnor (n76, n71, n71);
xnor (n77, n72, n72);
nor (n78, n73, n76);
xnor (n79, n75, n70);
or (n80, n53, n78);
nor (n81, n79, n77);
or (n82, n39, n81);

endmodule