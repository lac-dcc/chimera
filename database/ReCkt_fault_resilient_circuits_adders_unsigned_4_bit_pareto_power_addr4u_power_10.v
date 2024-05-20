// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to power and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 60.8 %    (Lower is better)
// gates = 32.0
// levels = 11
// area = 45.93    (For MCNC library relative to nand2)
// power = 168.9 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 21.6 ns    (Berkely-ABC for MCNC library)
// PDP = 3.64824e-12 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n25, n23, n37, n39, n33} = O[4:0]

module addr4u_power_10 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n25, n23, n37, n39, n33
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n25, n23, n37, n39, n33;
wire n38, n20, n14, n35, n22, n32, n31, n36, n11, n17, n34, n29, n13, n18, n30, n24, n9, n16, n8, n15, 
n10, n26, n19, n21, n27, n28, n12;

and (n8, n3, n7);
xnor (n9, n6, n2);
xor (n10, n1, n5);
nand (n11, n5, n1);
nand (n12, n4, n0);
nand (n13, n2, n6);
xnor (n14, n7, n3);
xor (n15, n4, n0);
xor (n16, n9, n8);
nand (n17, n8, n16);
xor (n18, n4, n4);
nand (n19, n17, n13);
nand (n20, n10, n19);
xnor (n21, n10, n19);
nand (n22, n20, n11);
xor (n23, n15, n22);
nand (n24, n15, n22);
nand (n25, n24, n12);
xor (n26, n0, n18);
xor (n27, n26, n0);
xnor (n28, n27, n18);
xnor (n29, n28, n27);
xnor (n30, n29, n28);
and (n31, n8, n29);
xnor (n32, n30, n26);
nor (n33, n14, n31);
xnor (n34, n32, n32);
xnor (n35, n34, n34);
not (n36, n21);
and (n37, n36, n36);
and (n38, n16, n35);
nor (n39, n38, n16);

endmodule