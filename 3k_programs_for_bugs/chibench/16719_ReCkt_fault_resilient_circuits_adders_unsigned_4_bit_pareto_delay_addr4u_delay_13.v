// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to delay and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 58.8 %    (Lower is better)
// gates = 33.0
// levels = 9
// area = 48.25    (For MCNC library relative to nand2)
// power = 311.2 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 13.3 ns    (Berkely-ABC for MCNC library)
// PDP = 4.13896e-12 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n41, n24, n20, n42, n34} = O[4:0]

module addr4u_delay_13 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n41, n24, n20, n42, n34
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n41, n24, n20, n42, n34;
wire n38, n23, n14, n35, n22, n32, n31, n36, n33, n37, n11, n17, n29, n13, n18, n30, n9, n16, n8, n15, 
n25, n10, n26, n19, n21, n27, n28, n12;

nand (n8, n6, n2);
xor (n9, n5, n1);
nand (n10, n0, n4);
and (n11, n3, n7);
xor (n12, n6, n2);
xor (n13, n4, n0);
xnor (n14, n7, n3);
nand (n15, n1, n5);
xnor (n16, n12, n11);
xnor (n17, n1, n1);
nand (n18, n12, n11);
nand (n19, n18, n8);
xor (n20, n9, n19);
nand (n21, n19, n9);
nand (n22, n21, n15);
nand (n23, n13, n22);
xor (n24, n13, n22);
xor (n25, n23, n13);
xnor (n26, n0, n0);
xnor (n27, n17, n26);
xnor (n28, n26, n17);
xnor (n29, n3, n27);
xnor (n30, n28, n27);
xnor (n31, n29, n16);
xnor (n32, n30, n28);
xor (n33, n31, n29);
nand (n34, n14, n14);
xnor (n35, n30, n32);
nor (n36, n33, n35);
or (n37, n25, n32);
nand (n38, n23, n10);
and (n41, n38, n37);
nor (n42, n16, n36);

endmodule