// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to area and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 69.7 %    (Lower is better)
// gates = 28.0
// levels = 13
// area = 38.27    (For MCNC library relative to nand2)
// power = 175.2 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 22.5 ns    (Berkely-ABC for MCNC library)
// PDP = 3.942e-12 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n25, n23, n37, n38, n33} = O[4:0]

module addr4u_area_14 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n25, n23, n37, n38, n33
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n25, n23, n37, n38, n33;
wire n29, n13, n30, n24, n20, n9, n14, n16, n35, n22, n8, n15, n32, n10, n31, n26, n19, n21, n27, n11, 
n28, n12, n17;

and (n8, n3, n7);
xor (n9, n6, n2);
xor (n10, n1, n5);
nand (n11, n5, n1);
nand (n12, n4, n0);
nand (n13, n2, n6);
xnor (n14, n7, n3);
xor (n15, n4, n0);
xnor (n16, n9, n8);
nand (n17, n8, n16);
nand (n19, n17, n13);
nand (n20, n10, n19);
xnor (n21, n10, n19);
nand (n22, n20, n11);
xor (n23, n15, n22);
nand (n24, n15, n22);
nand (n25, n24, n12);
nand (n26, n21, n21);
xnor (n27, n26, n0);
xnor (n28, n27, n14);
xnor (n29, n28, n27);
xnor (n30, n29, n28);
and (n31, n14, n29);
xnor (n32, n30, n30);
nor (n33, n14, n31);
nand (n35, n21, n32);
and (n37, n35, n26);
nand (n38, n16, n16);

endmodule