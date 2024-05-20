// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to power and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 97.2 %    (Lower is better)
// gates = 75.0
// levels = 17
// area = 90.97    (For MCNC library relative to nand2)
// power = 516.6 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 22.8 ns    (Berkely-ABC for MCNC library)
// PDP = 1.17785e-11 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n82, n81, n75, n70, n54, n51, n26, n10} = O[7:0]

module mult4u_power_2 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n82, n81, n75, n70, n54, n51, n26, n10
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n82, n81, n75, n70, n54, n51, n26, n10;
wire n16, n73, n77, n40, n38, n78, n76, n46, n50, n15, n66, n36, n67, n18, n13, n21, n32, n35, n64, n57, 
n65, n33, n17, n61, n19, n58, n68, n24, n74, n44, n20, n62, n60, n28, n59, n80, n27, n79, n69, n45, 
n71, n25, n14, n43, n8, n39, n34, n37, n31, n42, n52, n56, n12, n63, n30, n22, n11, n49, n29, n9, 
n72, n47, n55, n53, n23, n41, n48;

nand (n8, n4, n0);
and (n9, n5, n0);
and (n10, n7, n3);
nand (n11, n7, n1);
nand (n12, n7, n0);
nand (n13, n4, n1);
not (n14, n6);
nand (n15, n4, n3);
nand (n16, n4, n2);
nand (n17, n0, n0);
nand (n18, n5, n1);
nand (n19, n6, n2);
nand (n20, n6, n3);
nand (n21, n5, n2);
nand (n22, n7, n2);
nand (n23, n6, n1);
and (n24, n5, n3);
nand (n25, n12, n23);
xor (n26, n20, n22);
nor (n27, n14, n17);
xor (n28, n12, n23);
nor (n29, n20, n22);
or (n30, n19, n11);
and (n31, n19, n11);
not (n32, n15);
nor (n33, n27, n27);
not (n34, n31);
nand (n35, n29, n1);
nor (n36, n29, n31);
nand (n37, n36, n30);
nand (n38, n35, n37);
nand (n39, n37, n34);
nand (n40, n28, n39);
xor (n41, n28, n39);
nand (n42, n24, n38);
nor (n43, n24, n38);
nand (n44, n40, n25);
xor (n45, n21, n41);
nor (n46, n42, n42);
nand (n47, n21, n41);
nand (n48, n45, n42);
nor (n49, n44, n33);
xor (n50, n44, n27);
nor (n51, n43, n46);
xor (n52, n45, n46);
nand (n53, n32, n52);
xor (n54, n32, n52);
nor (n55, n9, n49);
xor (n56, n50, n18);
and (n57, n49, n5);
nand (n58, n50, n18);
nand (n59, n48, n47);
nor (n60, n55, n57);
xor (n61, n56, n59);
nand (n62, n56, n59);
nand (n63, n62, n58);
nand (n64, n16, n61);
nor (n65, n60, n60);
xor (n66, n16, n61);
xor (n67, n60, n63);
nand (n68, n66, n53);
nor (n69, n65, n63);
xnor (n70, n66, n53);
nand (n71, n68, n64);
nand (n72, n67, n13);
nor (n73, n69, n57);
xor (n74, n67, n13);
xnor (n75, n74, n71);
not (n76, n8);
nand (n77, n74, n71);
xor (n78, n8, n73);
nand (n79, n77, n72);
nand (n80, n78, n79);
xnor (n81, n78, n79);
and (n82, n80, n76);

endmodule