// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

module ALU_32bit(
    input [31:0] A, input [31:0] B,
    input [2:0] ALUControl,
    output reg [31:0] Result, output reg Zero
);
    wire [31:0] AndOut;
    wire [31:0] OrOut;
    wire [31:0] XorOut;

    // Intermediate signals for addition
    reg [31:0] AdderOut;

    // 32-bit AND operation
    assign AndOut = A & B;

    // 32-bit OR operation
    assign OrOut = A | B;

    // 32-bit XOR operation
    assign XorOut = A ^ B;

    // 32-bit addition using Full Adders
    integer i;
    always @(*)
    begin
        AdderOut[0] = A[0] ^ B[0] ^ ALUControl[0];
        for (i = 1; i < 32; i = i + 1)
        begin
            AdderOut[i] = A[i] ^ B[i] ^ ALUControl[0] ^ (A[i - 1] & B[i - 1] & ALUControl[0]);
        end
    end

    // Output multiplexer based on ALUControl bits
    always @(*)
    begin
        case(ALUControl)
            3'b000: Result = {AdderOut[31], AdderOut[30:0]}; // Addition
            3'b001: Result = AndOut;       // AND operation
            3'b010: Result = OrOut;        // OR operation
            3'b011: Result = XorOut;       // XOR operation
            default: Result = 32'b0;       // Default case
        endcase
    end

    // Zero flag generation
    always @(*)
    begin
        Zero <= (Result == 32'b0) ? 1'b1 : 1'b0;
    end
endmodule
