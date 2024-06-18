// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to area and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 74.1 %    (Lower is better)
// gates = 27.0
// levels = 12
// area = 35.94    (For MCNC library relative to nand2)
// power = 161.1 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 21.7 ns    (Berkely-ABC for MCNC library)
// PDP = 3.49587e-12 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n25, n30, n34, n31, n18} = O[4:0]

module addr4u_area_11 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n25, n30, n34, n31, n18
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n25, n30, n34, n31, n18;
wire n29, n13, n24, n20, n9, n23, n14, n16, n8, n22, n15, n32, n10, n26, n19, n21, n33, n27, n11, n28, 
n12, n17;

nand (n8, n2, n6);
xnor (n9, n3, n7);
nand (n10, n1, n5);
nand (n11, n4, n0);
xor (n12, n5, n1);
xor (n13, n0, n4);
xor (n14, n6, n2);
and (n15, n3, n9);
xnor (n16, n14, n15);
nand (n17, n14, n16);
nand (n18, n9, n9);
nand (n19, n17, n8);
xnor (n20, n12, n19);
nand (n21, n12, n20);
nand (n22, n21, n10);
xnor (n23, n13, n22);
nand (n24, n13, n23);
nand (n25, n24, n11);
xnor (n26, n20, n0);
xnor (n27, n20, n26);
and (n28, n16, n16);
xnor (n29, n26, n27);
nor (n30, n23, n23);
nor (n31, n16, n28);
and (n32, n20, n29);
and (n33, n32, n29);
nor (n34, n33, n20);

endmodule