// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to pdp and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 57.4 %    (Lower is better)
// gates = 35.0
// levels = 11
// area = 49.91    (For MCNC library relative to nand2)
// power = 208.3 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 20.9 ns    (Berkely-ABC for MCNC library)
// PDP = 4.35347e-12 J

// Pin mapping:
// {n0, n1, n2, n3} = A[3:0]
// {n4, n5, n6, n7} = B[3:0]
// {n25, n37, n42, n17, n29} = O[4:0]

module addr4u_pdp_29 (
n0, n1, n2, n3, n4, n5, n6, n7, 
n25, n37, n42, n17, n29
);

input n0, n1, n2, n3, n4, n5, n6, n7;
output n25, n37, n42, n17, n29;
wire n38, n41, n20, n23, n14, n35, n22, n32, n31, n36, n33, n40, n39, n11, n34, n13, n18, n30, n24, n9, 
n16, n8, n15, n10, n26, n19, n21, n27, n28, n12;

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
xnor (n26, n18, n18);
xnor (n27, n18, n18);
xnor (n28, n26, n26);
and (n29, n18, n18);
xnor (n30, n21, n27);
not (n31, n28);
xnor (n32, n30, n27);
xnor (n33, n30, n31);
xnor (n34, n28, n31);
xnor (n35, n32, n33);
xnor (n36, n35, n33);
and (n37, n23, n23);
xnor (n38, n34, n34);
xnor (n39, n35, n38);
and (n40, n36, n39);
and (n41, n21, n40);
or (n42, n41, n21);

endmodule