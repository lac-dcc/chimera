// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to area and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 93.5 %    (Lower is better)
// gates = 20.0
// levels = 10
// area = 26.31    (For MCNC library relative to nand2)
// power = 103.0 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 14.2 ns    (Berkely-ABC for MCNC library)
// PDP = 1.4626e-12 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n25, n30, n20, n31, n18} = O[4:0]

module addr4u_area_4 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n25, n30, n20, n31, n18
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n25, n30, n20, n31, n18;
wire n15, n16, n11, n8, n10, n13, n12, n19, n21, n24, n9, n23, n14, n17, n22;

nand (n8, n2, n6);
xnor (n9, n7, n3);
nand (n10, n1, n5);
nand (n11, n4, n0);
xor (n12, n5, n1);
xor (n13, n0, n4);
xor (n14, n6, n2);
and (n15, n9, n3);
xnor (n16, n14, n15);
nand (n17, n16, n14);
nand (n18, n9, n9);
nand (n19, n17, n8);
xor (n20, n12, n19);
nand (n21, n12, n19);
nand (n22, n21, n10);
xnor (n23, n13, n22);
nand (n24, n13, n23);
nand (n25, n24, n11);
nand (n30, n23, n23);
nand (n31, n16, n16);

endmodule