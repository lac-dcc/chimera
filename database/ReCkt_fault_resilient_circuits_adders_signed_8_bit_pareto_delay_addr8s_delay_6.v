// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to delay and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 75.2 %    (Lower is better)
// gates = 55.0
// levels = 15
// area = 79.25    (For MCNC library relative to nand2)
// power = 433.8 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 17.7 ns    (Berkely-ABC for MCNC library)
// PDP = 7.67826e-12 J

// Pin mapping:
// {n0, n1, n2, n3, n4, n5, n6, n7} = A[7:0]
// {n8, n9, n10, n11, n12, n13, n14, n15} = B[7:0]
// {n54, n80, n48, n45, n42, n75, n37, n34, n63} = O[8:0]

module addr8s_delay_6 (
n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
n54, n80, n48, n45, n42, n75, n37, n34, n63
);

input n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
output n54, n80, n48, n45, n42, n75, n37, n34, n63;
wire n22, n28, n21, n49, n30, n16, n27, n52, n24, n56, n66, n20, n53, n32, n64, n18, n74, n55, n51, n70, 
n31, n39, n25, n58, n41, n26, n76, n35, n29, n17, n38, n19, n43, n62, n78, n50, n69, n46, n47, n59, 
n23, n40, n36, n57, n33, n44;

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
xnor (n57, n55, n39);
xnor (n58, n32, n32);
xnor (n59, n58, n56);
xnor (n62, n55, n58);
and (n63, n32, n32);
xnor (n64, n32, n32);
xnor (n66, n62, n56);
xnor (n69, n64, n39);
and (n70, n69, n57);
xor (n74, n59, n66);
or (n75, n70, n39);
xor (n76, n74, n59);
or (n78, n64, n76);
and (n80, n53, n78);

endmodule