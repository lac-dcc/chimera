// This program was cloned from: https://github.com/umar-afzaal/ReCkt
// License: MIT License

// This file contains a pareto-optimal circuit with respect to area and the fault-resilince parameter p_fault which is defined as:
// "For all input vectors, the ratio of the no. of faults observable at the POs to the no. of total possible faults in the circuit".
// This code is part of the ReCkt library (https://github.com/umar-afzaal/ReCkt) distributed under The MIT License.
// When used, please cite the following article(s):
// U. Afzaal, A.S. Hassan, M. Usman and J.A. Lee, "On the Evolutionary Synthesis of Increased Fault-resilience Arithmetic Circuits".

// p_fault = 94.9 %    (Lower is better)
// gates = 42.0
// levels = 17
// area = 56.97    (For MCNC library relative to nand2)
// power = 235.7 uW    (Berkely-SIS for MCNC library @ Vdd=5V and 20 MHz clock)
// delay = 20.8 ns    (Berkely-ABC for MCNC library)
// PDP = 4.90256e-12 J

// Pin mapping:
// {n0, n1, n2, n3, n4, n5, n6, n7} = A[7:0]
// {n8, n9, n10, n11, n12, n13, n14, n15} = B[7:0]
// {n54, n65, n48, n45, n43, n62, n37, n32, n33} = O[8:0]

module addr8s_area_4 (
n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
n54, n65, n48, n45, n43, n62, n37, n32, n33
);

input n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
output n54, n65, n48, n45, n43, n62, n37, n32, n33;
wire n22, n42, n28, n21, n49, n30, n16, n27, n52, n24, n20, n53, n18, n55, n51, n31, n39, n25, n41, n26, 
n35, n29, n17, n38, n19, n34, n50, n46, n47, n23, n40, n36, n44;

nand (n16, n12, n4);
xor (n17, n8, n0);
nand (n18, n13, n5);
nand (n19, n10, n2);
xor (n20, n13, n5);
nand (n21, n11, n3);
xnor (n22, n15, n7);
xor (n23, n12, n4);
xor (n24, n9, n1);
nand (n25, n1, n9);
nand (n26, n8, n0);
xor (n27, n11, n3);
xor (n28, n14, n6);
nand (n29, n14, n6);
and (n30, n15, n7);
xor (n31, n10, n2);
xor (n32, n28, n30);
nand (n33, n22, n22);
nand (n34, n28, n30);
nand (n35, n34, n29);
nand (n36, n20, n35);
xor (n37, n20, n35);
nand (n38, n36, n18);
nand (n39, n23, n38);
xnor (n40, n23, n38);
nand (n41, n16, n39);
nand (n42, n27, n41);
xor (n43, n27, n41);
nand (n44, n42, n21);
xor (n45, n31, n44);
nand (n46, n31, n44);
nand (n47, n19, n46);
xor (n48, n24, n47);
nand (n49, n24, n47);
and (n50, n49, n25);
nand (n51, n50, n50);
nand (n52, n17, n50);
xnor (n53, n17, n51);
nand (n54, n52, n26);
and (n55, n53, n53);
nand (n62, n40, n40);
nand (n65, n53, n55);

endmodule