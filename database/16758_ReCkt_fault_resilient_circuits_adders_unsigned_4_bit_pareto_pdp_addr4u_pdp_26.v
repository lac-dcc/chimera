// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to pdp and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 57.1 %    (Lower is better)
// gates = 32.0
// levels = 11
// area = 45.93    (For MCNC library relative to nand2)
// power = 213.3 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 20.5 ns    (Berkely-ABC for MCNC library)
// PDP = 4.37265e-12 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n25, n23, n20, n18, n39} = O[4:0]

module addr4u_pdp_26 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n25, n23, n20, n18, n39
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n25, n23, n20, n18, n39;
wire n38, n14, n35, n22, n32, n31, n36, n33, n37, n11, n17, n34, n29, n13, n30, n24, n9, n16, n8, n15, 
n10, n26, n19, n21, n27, n28, n12;

xor (n8, n4, n0);
nand (n9, n4, n0);
nand (n10, n5, n1);
nand (n11, n6, n2);
nor (n12, n7, n3);
xor (n13, n6, n2);
and (n14, n7, n3);
xor (n15, n5, n1);
nor (n16, n12, n14);
nand (n17, n13, n14);
xor (n18, n13, n14);
nand (n19, n17, n11);
xor (n20, n15, n19);
nand (n21, n15, n19);
nand (n22, n21, n10);
xor (n23, n8, n22);
nand (n24, n8, n22);
nand (n25, n24, n9);
xnor (n26, n16, n16);
xnor (n27, n16, n16);
xnor (n28, n26, n26);
xnor (n29, n27, n27);
xnor (n30, n28, n28);
xnor (n31, n29, n29);
or (n32, n30, n30);
xnor (n33, n31, n31);
xor (n34, n32, n33);
xnor (n35, n32, n33);
xnor (n36, n35, n35);
nor (n37, n36, n36);
nand (n38, n34, n37);
and (n39, n16, n38);

endmodule