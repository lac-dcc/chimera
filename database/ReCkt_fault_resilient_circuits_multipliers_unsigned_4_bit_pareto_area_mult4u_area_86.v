// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to area and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 56.5 %    (Lower is better)
// gates = 117.0
// levels = 20
// area = 159.07    (For MCNC library relative to nand2)
// power = 977.5 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 41.2 ns    (Berkely-ABC for MCNC library)
// PDP = 4.0273e-11 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n82, n81, n75, n67, n132, n51, n26, n20} = O[7:0]

module mult4u_area_86 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n82, n81, n75, n67, n132, n51, n26, n20
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n82, n81, n75, n67, n132, n51, n26, n20;
wire n119, n95, n120, n16, n73, n122, n77, n113, n41, n40, n108, n38, n78, n76, n106, n46, n50, n83, n15, n114, 
n66, n111, n36, n35, n18, n99, n32, n13, n21, n103, n101, n64, n92, n94, n57, n65, n115, n90, n33, n10, 
n17, n70, n93, n118, n107, n116, n97, n96, n109, n61, n19, n58, n68, n24, n74, n44, n62, n121, n60, n28, 
n89, n91, n59, n80, n100, n27, n105, n79, n69, n104, n45, n71, n98, n25, n14, n43, n8, n88, n126, n86, 
n39, n34, n37, n31, n42, n48, n123, n52, n124, n56, n54, n12, n63, n30, n22, n110, n85, n11, n49, n29, 
n9, n72, n47, n55, n53, n23, n87, n102, n84;

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
xnor (n84, n83, n20);
xnor (n85, n20, n20);
xor (n86, n20, n20);
xnor (n87, n20, n85);
xnor (n88, n87, n20);
xnor (n89, n20, n20);
xnor (n90, n20, n88);
xnor (n91, n88, n86);
xnor (n92, n20, n90);
xnor (n93, n92, n84);
xnor (n94, n84, n89);
xnor (n95, n83, n93);
xnor (n96, n89, n91);
xnor (n97, n85, n95);
xnor (n98, n96, n87);
xnor (n99, n92, n96);
xnor (n100, n94, n97);
xnor (n101, n94, n100);
xnor (n102, n98, n100);
xnor (n103, n90, n99);
xnor (n104, n91, n101);
xnor (n105, n93, n103);
xnor (n106, n98, n103);
xnor (n107, n102, n95);
xnor (n108, n105, n107);
xnor (n109, n106, n105);
xnor (n110, n104, n99);
xnor (n111, n102, n104);
xnor (n113, n110, n109);
nand (n114, n111, n86);
xnor (n115, n111, n113);
xor (n116, n106, n115);
xnor (n118, n108, n97);
xnor (n119, n116, n115);
xnor (n120, n101, n109);
xor (n121, n107, n108);
xnor (n122, n121, n120);
xnor (n123, n122, n118);
xnor (n124, n119, n123);
nor (n126, n124, n114);
or (n132, n56, n126);

endmodule