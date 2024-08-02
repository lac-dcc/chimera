// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to area and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 64.2 %    (Lower is better)
// gates = 101.0
// levels = 20
// area = 137.79    (For MCNC library relative to nand2)
// power = 840.2 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 32.1 ns    (Berkely-ABC for MCNC library)
// PDP = 2.69704e-11 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n122, n81, n125, n67, n53, n52, n92, n24} = O[7:0]

module mult4u_area_62 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n122, n81, n125, n67, n53, n52, n92, n24
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n122, n81, n125, n67, n53, n52, n92, n24;
wire n95, n16, n73, n77, n26, n41, n40, n108, n38, n78, n76, n46, n50, n51, n83, n15, n66, n111, n36, n35, 
n18, n99, n32, n13, n21, n64, n94, n57, n65, n90, n33, n10, n17, n70, n93, n96, n116, n97, n61, n19, 
n58, n68, n74, n44, n20, n62, n60, n28, n89, n91, n59, n80, n100, n82, n27, n105, n79, n69, n45, n71, 
n98, n25, n14, n75, n43, n8, n88, n86, n39, n34, n37, n31, n112, n42, n56, n54, n12, n63, n30, n22, 
n110, n85, n11, n49, n29, n9, n72, n47, n55, n23, n87, n48, n84;

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
xnor (n33, n0, n29);
nand (n34, n24, n1);
nand (n35, n13, n29);
xnor (n36, n0, n0);
nand (n37, n31, n30);
nand (n38, n37, n35);
nand (n39, n34, n37);
nand (n40, n19, n39);
xor (n41, n25, n38);
nand (n42, n25, n38);
xnor (n43, n19, n39);
nand (n44, n21, n41);
and (n45, n40, n40);
nand (n46, n42, n27);
xnor (n47, n21, n41);
xor (n48, n47, n45);
nand (n49, n48, n40);
nor (n50, n46, n15);
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
nand (n69, n66, n56);
nor (n70, n64, n65);
xor (n71, n68, n14);
nor (n72, n70, n57);
nand (n73, n68, n14);
nand (n74, n69, n63);
xnor (n75, n71, n74);
xor (n76, n23, n72);
nand (n77, n23, n23);
nand (n78, n71, n75);
nand (n79, n78, n73);
nand (n80, n72, n79);
xnor (n81, n76, n79);
and (n82, n80, n77);
xnor (n83, n2, n0);
xnor (n84, n36, n83);
xnor (n85, n83, n84);
xnor (n86, n33, n85);
xnor (n87, n36, n0);
xnor (n88, n87, n86);
xnor (n89, n22, n88);
xnor (n90, n89, n0);
xnor (n91, n33, n87);
and (n92, n26, n26);
xnor (n93, n84, n89);
xnor (n94, n85, n93);
xnor (n95, n86, n91);
xnor (n96, n91, n94);
xnor (n97, n90, n90);
xnor (n98, n94, n95);
xnor (n99, n88, n98);
xnor (n100, n96, n93);
not (n105, n100);
xnor (n108, n105, n99);
xor (n110, n4, n108);
xor (n111, n110, n108);
xor (n112, n97, n96);
or (n116, n111, n112);
and (n122, n116, n82);
and (n125, n75, n75);

endmodule