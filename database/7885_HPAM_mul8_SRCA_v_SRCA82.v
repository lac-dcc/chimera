// This program was cloned from: https://github.com/clowdur/HPAM_mul8
// License: MIT License

// SRCA(8,2)
// synthesizable
// Oliver Huang and Jared Yoder

module SRCA82 (input [7:0] A, B, input Cin, output [7:0] Sum, output Cout);

    // Adder Block 0
    // Carry wires
    wire B0F0c, B0F1c;
    Approx_FA B0F0(.carry(B0F0c), .sum(Sum[0]), .a(A[0]), .b(B[0]), .cin(1'b0));
    FA B0F1(.carry(B0F1c), .sum(Sum[1]), .a(A[1]), .b(B[1]), .cin(B0F0c));

    // Adder Block 1
    // Carry wires
    wire B1F0c, B1F1c;
    Approx_FA B1F0(.carry(B1F0c), .sum(Sum[2]), .a(A[2]), .b(B[2]), .cin(B0F1c));
    FA B1F1(.carry(B1F1c), .sum(Sum[3]), .a(A[3]), .b(B[3]), .cin(B1F0c));

    // Adder Block 2
    // Carry wires
    wire B2F0c, B2F1c;
    Approx_FA B2F0(.carry(B2F0c), .sum(Sum[4]), .a(A[4]), .b(B[4]), .cin(B1F1c));
    FA B2F1(.carry(B2F1c), .sum(Sum[5]), .a(A[5]), .b(B[5]), .cin(B2F0c));

    // Adder Block 2
    // Carry wires
    wire B3F0c;
    Approx_FA B3F0(.carry(B3F0c), .sum(Sum[6]), .a(A[6]), .b(B[6]), .cin(B2F1c));
    FA B3F1(.carry(Cout), .sum(Sum[7]), .a(A[7]), .b(B[7]), .cin(B3F0c));

endmodule