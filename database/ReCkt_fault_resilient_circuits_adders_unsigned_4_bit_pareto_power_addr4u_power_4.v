// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to power and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 90.4 %    (Lower is better)
// gates = 22.0
// levels = 8
// area = 30.63    (For MCNC library relative to nand2)
// power = 98.6 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 12.8 ns    (Berkely-ABC for MCNC library)
// PDP = 1.26208e-12 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n25, n24, n28, n30, n18} = O[4:0]

module addr4u_power_4 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n25, n24, n28, n30, n18
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n25, n24, n28, n30, n18;
wire n15, n16, n11, n8, n10, n13, n12, n26, n19, n21, n27, n20, n9, n23, n14, n17, n22;

nand (n8, n1, n5);
xnor (n9, n2, n6);
and (n10, n3, n7);
and (n11, n6, n2);
xnor (n12, n3, n7);
nand (n13, n0, n4);
xor (n14, n4, n0);
xor (n15, n1, n5);
xor (n16, n10, n9);
and (n17, n16, n10);
nand (n18, n12, n12);
xor (n19, n17, n11);
nand (n20, n15, n19);
xnor (n21, n15, n19);
nand (n22, n20, n8);
nand (n23, n14, n22);
xor (n24, n14, n22);
nand (n25, n23, n13);
nand (n26, n16, n16);
and (n27, n21, n21);
nand (n28, n21, n27);
and (n30, n26, n26);

endmodule