// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to pdp and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 90.2 %    (Lower is better)
// gates = 22.0
// levels = 7
// area = 29.64    (For MCNC library relative to nand2)
// power = 105.2 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 7.9 ns    (Berkely-ABC for MCNC library)
// PDP = 8.3108e-13 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n25, n23, n26, n38, n33} = O[4:0]

module addr4u_pdp_3 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n25, n23, n26, n38, n33
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n25, n23, n26, n38, n33;
wire n15, n16, n8, n10, n13, n12, n31, n19, n18, n21, n24, n20, n9, n11, n14, n17, n22;

and (n8, n3, n7);
xor (n9, n6, n2);
xor (n10, n5, n1);
nand (n11, n5, n1);
nand (n12, n4, n0);
nand (n13, n2, n6);
xnor (n14, n7, n3);
xor (n15, n4, n0);
xor (n16, n9, n8);
nand (n17, n9, n8);
and (n18, n14, n14);
nand (n19, n17, n13);
nand (n20, n10, n19);
xnor (n21, n10, n19);
nand (n22, n20, n11);
xor (n23, n15, n22);
nand (n24, n15, n22);
nand (n25, n24, n12);
nand (n26, n21, n21);
and (n31, n14, n14);
nor (n33, n18, n31);
and (n38, n16, n16);

endmodule