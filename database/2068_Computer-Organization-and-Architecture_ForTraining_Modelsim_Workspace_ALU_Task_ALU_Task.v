// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

module HalfAdder(
    input A, input B,
    output Sum, output Cout
);
    assign Sum = A ^ B;
    assign Cout = A & B;
endmodule

module FullAdder(
    input A, input B, input Cin,
    output Sum, output Cout
);
    wire HACout1, HACout2;
    HalfAdder HA1(.A(A), .B(B), .Sum(Sum), .Cout(HACout1));
    HalfAdder HA2(.A(Sum), .B(Cin), .Sum(Sum), .Cout(HACout2));
    assign Cout = HACout1 | HACout2;
endmodule

module ALU_32bit(
    input [31:0] A, input [31:0] B,
    input [2:0] ALUControl,
    output reg [31:0] Result, output reg Zero
);
    wire [31:0] AdderOut;
    wire [31:0] AndOut;
    wire [31:0] OrOut;
    wire [31:0] XorOut;

    // 32-bit addition using Full Adders
    FullAdder FA[31:0](
        .A(A), .B(B), .Cin(ALUControl[0]),
        .Sum(AdderOut), .Cout()
    );

    // 32-bit AND operation
    assign AndOut = A & B;

    // 32-bit OR operation
    assign OrOut = A | B;

    // 32-bit XOR operation
    assign XorOut = A ^ B;

    // Output multiplexer based on ALUControl bits
    always @(*) begin
        case(ALUControl)
            3'b000: Result = AdderOut;     // Addition
            3'b001: Result = AndOut;       // AND operation
            3'b010: Result = OrOut;        // OR operation
            3'b011: Result = XorOut;       // XOR operation
            default: Result = 32'b0;       // Default case
        endcase
    end

    // Zero flag generation
    always @(posedge Result or negedge Result) begin
        Zero <= (Result == 32'b0) ? 1'b1 : 1'b0;
    end
endmodule
