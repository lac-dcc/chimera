// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to pdp and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 69.4 %    (Lower is better)
// gates = 104.0
// levels = 17
// area = 137.14    (For MCNC library relative to nand2)
// power = 839.7 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 22.8 ns    (Berkely-ABC for MCNC library)
// PDP = 1.91452e-11 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n82, n81, n75, n67, n132, n112, n26, n20} = O[7:0]

module mult4u_pdp_33 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n82, n81, n75, n67, n132, n112, n26, n20
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n82, n81, n75, n67, n132, n112, n26, n20;
wire n119, n95, n16, n73, n77, n41, n40, n38, n78, n76, n106, n46, n50, n51, n83, n15, n66, n36, n35, n18, 
n99, n32, n13, n21, n103, n64, n92, n94, n57, n65, n115, n90, n33, n10, n17, n70, n93, n96, n116, n97, 
n61, n19, n58, n68, n24, n74, n44, n62, n60, n28, n89, n91, n59, n80, n100, n27, n79, n69, n104, n45, 
n71, n98, n25, n14, n43, n8, n88, n126, n86, n39, n34, n37, n31, n125, n42, n52, n56, n54, n12, n63, 
n30, n22, n110, n85, n11, n49, n29, n9, n72, n47, n55, n53, n23, n87, n48, n84;

not (n8, n0);
nand (n9, n6, n2);
nand (n10, n5, n1);
nand (n11, n4, n2);
nand (n12, n7, n2);
nand (n13, n4, n0);
nand (n14, n7, n1);
and (n15, n5, n0);
nand (n16, n4, n3);
nand (n17, n6, n3);
and (n18, n5, n3);
nand (n19, n6, n1);
and (n20, n7, n3);
nand (n21, n4, n1);
not (n22, n6);
nand (n23, n7, n0);
nand (n24, n5, n2);
xor (n25, n23, n19);
xor (n26, n17, n12);
and (n27, n9, n14);
or (n28, n9, n14);
nand (n29, n23, n19);
not (n30, n16);
nor (n31, n22, n8);
nor (n32, n17, n12);
not (n33, n27);
nor (n34, n32, n27);
not (n35, n31);
nand (n36, n32, n1);
nand (n37, n34, n28);
nand (n38, n36, n37);
nand (n39, n37, n33);
nand (n40, n18, n38);
nor (n41, n18, n38);
nand (n42, n25, n39);
xor (n43, n25, n39);
nand (n44, n24, n43);
xor (n45, n24, n43);
nand (n46, n42, n29);
not (n47, n40);
xor (n48, n45, n47);
nand (n49, n45, n40);
xor (n50, n46, n31);
nor (n51, n41, n47);
nor (n52, n46, n35);
nor (n53, n15, n52);
xor (n54, n50, n10);
nand (n55, n50, n10);
xor (n56, n30, n48);
and (n57, n52, n5);
nand (n58, n30, n48);
nand (n59, n49, n44);
xor (n60, n54, n59);
nand (n61, n54, n59);
nor (n62, n53, n57);
not (n63, n62);
nand (n64, n11, n60);
xor (n65, n11, n60);
nand (n66, n61, n55);
xnor (n67, n65, n58);
nor (n68, n63, n66);
xor (n69, n62, n66);
nand (n70, n65, n58);
xor (n71, n69, n21);
nand (n72, n69, n21);
nand (n73, n70, n64);
nor (n74, n68, n57);
xnor (n75, n71, n73);
nand (n76, n71, n73);
xor (n77, n13, n74);
nand (n78, n13, n74);
nand (n79, n76, n72);
nand (n80, n77, n79);
xnor (n81, n77, n79);
and (n82, n80, n78);
xnor (n83, n20, n20);
xnor (n84, n20, n20);
xnor (n85, n20, n20);
xnor (n86, n20, n20);
xnor (n87, n20, n20);
xnor (n88, n20, n20);
xnor (n89, n87, n20);
xnor (n90, n20, n88);
xnor (n91, n86, n85);
xnor (n92, n84, n87);
xnor (n93, n83, n85);
xnor (n94, n88, n89);
xnor (n95, n20, n51);
xnor (n96, n89, n92);
xnor (n97, n83, n95);
xnor (n98, n84, n90);
xnor (n99, n92, n96);
xnor (n100, n94, n97);
xor (n103, n98, n96);
xnor (n104, n91, n93);
xnor (n106, n104, n103);
xnor (n110, n90, n99);
and (n112, n51, n51);
xnor (n115, n110, n99);
xnor (n116, n106, n106);
xnor (n119, n116, n100);
xnor (n125, n115, n115);
nor (n126, n125, n119);
or (n132, n56, n126);

endmodule