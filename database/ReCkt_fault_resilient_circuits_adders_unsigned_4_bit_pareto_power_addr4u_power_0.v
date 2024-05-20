// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to power and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 97.8 %    (Lower is better)
// gates = 18.0
// levels = 7
// area = 25.66    (For MCNC library relative to nand2)
// power = 95.2 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 7.9 ns    (Berkely-ABC for MCNC library)
// PDP = 7.5208e-13 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n25, n24, n21, n16, n18} = O[4:0]

module addr4u_power_0 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n25, n24, n21, n16, n18
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n25, n24, n21, n16, n18;
wire n10, n11, n8, n13, n19, n22, n20, n9, n14, n23, n12, n17, n15;

nand (n8, n5, n1);
xor (n9, n6, n2);
and (n10, n7, n3);
nand (n11, n6, n2);
xor (n12, n7, n3);
nand (n13, n4, n0);
xor (n14, n4, n0);
xor (n15, n5, n1);
xor (n16, n9, n10);
nand (n17, n9, n10);
or (n18, n12, n12);
nand (n19, n17, n11);
nand (n20, n15, n19);
xor (n21, n15, n19);
nand (n22, n20, n8);
nand (n23, n14, n22);
xor (n24, n14, n22);
nand (n25, n23, n13);

endmodule