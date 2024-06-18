// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to pdp and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 62.4 %    (Lower is better)
// gates = 109.0
// levels = 18
// area = 146.8    (For MCNC library relative to nand2)
// power = 818.7 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 30.1 ns    (Berkely-ABC for MCNC library)
// PDP = 2.46429e-11 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n117, n80, n75, n69, n53, n50, n103, n112} = O[7:0]

module mult4u_pdp_25 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n117, n80, n75, n69, n53, n50, n103, n112
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n117, n80, n75, n69, n53, n50, n103, n112;
wire n95, n16, n73, n77, n113, n26, n41, n40, n108, n38, n78, n76, n106, n46, n51, n83, n15, n114, n66, n111, 
n36, n67, n35, n18, n99, n32, n13, n21, n101, n64, n92, n94, n57, n65, n115, n90, n33, n10, n17, n70, 
n93, n107, n96, n97, n109, n61, n19, n58, n68, n81, n24, n74, n44, n20, n62, n60, n28, n89, n91, n59, 
n100, n82, n27, n105, n79, n104, n45, n71, n98, n25, n14, n43, n8, n88, n86, n39, n34, n37, n31, n42, 
n48, n52, n56, n54, n12, n63, n30, n22, n110, n85, n11, n49, n29, n9, n72, n47, n55, n23, n87, n102, 
n84;

nand (n8, n4, n0);
and (n9, n5, n0);
nand (n10, n5, n2);
not (n11, n6);
not (n12, n0);
nand (n13, n6, n1);
nand (n14, n5, n1);
nand (n15, n4, n2);
nand (n16, n4, n3);
nand (n17, n4, n1);
nand (n18, n7, n1);
nand (n19, n6, n3);
and (n20, n7, n3);
nand (n21, n7, n0);
nand (n22, n7, n2);
nand (n23, n6, n2);
and (n24, n5, n3);
xor (n25, n21, n13);
and (n26, n23, n18);
nand (n27, n21, n13);
xor (n28, n19, n22);
not (n29, n16);
nor (n30, n19, n22);
nor (n31, n11, n12);
or (n32, n23, n18);
not (n33, n31);
nand (n34, n30, n1);
nor (n35, n30, n26);
not (n36, n26);
nand (n37, n35, n32);
nand (n38, n37, n36);
nand (n39, n34, n37);
nand (n40, n25, n38);
nor (n41, n24, n39);
xor (n42, n25, n38);
nand (n43, n24, n39);
nand (n44, n40, n27);
xor (n45, n10, n42);
not (n46, n43);
nand (n47, n10, n42);
nor (n48, n44, n33);
xor (n49, n44, n31);
nor (n50, n41, n46);
nand (n51, n45, n43);
xor (n52, n45, n46);
xor (n53, n29, n52);
nand (n54, n51, n47);
nand (n55, n49, n14);
nor (n56, n9, n48);
xor (n57, n49, n14);
nand (n58, n29, n52);
and (n59, n48, n5);
xor (n60, n57, n54);
nand (n61, n57, n54);
nor (n62, n56, n59);
not (n63, n62);
nand (n64, n15, n60);
xor (n65, n15, n60);
nand (n66, n61, n55);
nand (n67, n65, n58);
xor (n68, n62, n66);
xnor (n69, n65, n58);
nor (n70, n63, n66);
xor (n71, n68, n17);
nand (n72, n68, n17);
nand (n73, n67, n64);
nor (n74, n70, n59);
xnor (n75, n71, n73);
nand (n76, n71, n73);
nand (n77, n8, n74);
xor (n78, n8, n74);
nand (n79, n76, n72);
xnor (n80, n78, n79);
nand (n81, n78, n79);
and (n82, n81, n77);
xnor (n83, n28, n28);
xor (n84, n20, n20);
xnor (n85, n20, n20);
xnor (n86, n20, n84);
xnor (n87, n83, n84);
xnor (n88, n20, n87);
xnor (n89, n20, n88);
xnor (n90, n84, n83);
xnor (n91, n87, n85);
xnor (n92, n83, n86);
xnor (n93, n89, n91);
xnor (n94, n93, n86);
xnor (n95, n88, n89);
xnor (n96, n93, n91);
xnor (n97, n94, n95);
xor (n98, n97, n90);
xnor (n99, n90, n96);
xnor (n100, n96, n94);
xor (n101, n100, n95);
xnor (n102, n92, n92);
xor (n103, n19, n22);
xnor (n104, n98, n102);
xnor (n105, n101, n102);
xnor (n106, n100, n101);
xnor (n107, n99, n99);
xnor (n108, n107, n106);
xnor (n109, n104, n108);
and (n110, n20, n109);
xor (n111, n105, n97);
or (n112, n20, n110);
xnor (n113, n111, n111);
xnor (n114, n107, n85);
or (n115, n114, n113);
and (n117, n82, n115);

endmodule