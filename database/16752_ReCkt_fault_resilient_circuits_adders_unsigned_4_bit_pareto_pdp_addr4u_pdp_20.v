// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to pdp and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 69.7 %    (Lower is better)
// gates = 28.0
// levels = 7
// area = 41.29    (For MCNC library relative to nand2)
// power = 171.4 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 11.4 ns    (Berkely-ABC for MCNC library)
// PDP = 1.95396e-12 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n25, n24, n20, n36, n34} = O[4:0]

module addr4u_pdp_20 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n25, n24, n20, n36, n34
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n25, n24, n20, n36, n34;
wire n29, n13, n18, n30, n9, n23, n14, n16, n8, n22, n15, n32, n10, n31, n26, n19, n21, n33, n27, n11, 
n28, n12, n17;

nand (n8, n6, n2);
xor (n9, n5, n1);
nand (n10, n4, n0);
and (n11, n3, n7);
xor (n12, n6, n2);
xor (n13, n4, n0);
xnor (n14, n7, n3);
nand (n15, n5, n1);
xor (n16, n12, n11);
xnor (n17, n1, n1);
nand (n18, n12, n11);
nand (n19, n18, n8);
xor (n20, n9, n19);
nand (n21, n9, n19);
nand (n22, n21, n15);
nand (n23, n13, n22);
xor (n24, n13, n22);
nand (n25, n23, n10);
xnor (n26, n11, n17);
xnor (n27, n17, n11);
xor (n28, n26, n27);
xnor (n29, n12, n27);
xor (n30, n28, n14);
xor (n31, n29, n29);
or (n32, n30, n28);
nand (n33, n31, n29);
nand (n34, n14, n32);
and (n36, n33, n16);

endmodule