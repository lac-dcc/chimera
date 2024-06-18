// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to power and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 86.1 %    (Lower is better)
// gates = 24.0
// levels = 7
// area = 33.65    (For MCNC library relative to nand2)
// power = 100.8 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 11.4 ns    (Berkely-ABC for MCNC library)
// PDP = 1.14912e-12 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n25, n37, n39, n17, n29} = O[4:0]

module addr4u_power_21 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n25, n37, n39, n17, n29
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n25, n37, n39, n17, n29;
wire n38, n13, n18, n24, n20, n9, n23, n14, n16, n8, n22, n15, n10, n26, n19, n21, n36, n11, n12;

nand (n8, n6, n2);
xor (n9, n5, n1);
and (n10, n7, n3);
nor (n11, n7, n3);
xor (n12, n6, n2);
nand (n13, n4, n0);
xor (n14, n4, n0);
nand (n15, n5, n1);
nand (n16, n12, n10);
xor (n17, n12, n10);
nor (n18, n11, n10);
nand (n19, n16, n8);
nand (n20, n9, n19);
xor (n21, n9, n19);
nand (n22, n20, n15);
xor (n23, n14, n22);
nand (n24, n14, n22);
nand (n25, n24, n13);
xor (n26, n18, n18);
and (n29, n18, n18);
xor (n36, n29, n18);
and (n37, n23, n23);
and (n38, n36, n26);
or (n39, n21, n38);

endmodule