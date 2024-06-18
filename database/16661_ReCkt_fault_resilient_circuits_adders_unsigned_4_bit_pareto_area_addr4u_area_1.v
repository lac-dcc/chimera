// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to area and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 97.7 %    (Lower is better)
// gates = 18.0
// levels = 8
// area = 24.99    (For MCNC library relative to nand2)
// power = 98.9 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 10.0 ns    (Berkely-ABC for MCNC library)
// PDP = 9.89e-13 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n25, n23, n20, n18, n17} = O[4:0]

module addr4u_area_1 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n25, n23, n20, n18, n17
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n25, n23, n20, n18, n17;
wire n10, n13, n12, n19, n21, n22, n24, n9, n14, n11, n16, n8, n15;

nand (n8, n5, n1);
xnor (n9, n7, n3);
nand (n10, n4, n0);
xor (n11, n6, n2);
nand (n12, n6, n2);
xor (n13, n4, n0);
and (n14, n7, n9);
xor (n15, n5, n1);
nand (n16, n11, n14);
nor (n17, n9, n9);
xor (n18, n11, n14);
nand (n19, n16, n12);
xor (n20, n15, n19);
nand (n21, n15, n19);
nand (n22, n21, n8);
xor (n23, n13, n22);
nand (n24, n13, n22);
nand (n25, n24, n10);

endmodule