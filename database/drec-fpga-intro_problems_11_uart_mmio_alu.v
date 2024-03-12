module alu(
    input [31:0]src_a,
    input [31:0]src_b,
    input [2:0]op,
    input alt,

    output reg [31:0]res
);

wire signed [31:0]sign_a = src_a;
wire signed [31:0]sign_b = src_b;
wire [4:0]shamt = src_b[4:0];

always @(*) begin
    case (op)
        3'b000: res = src_a + (alt ? (~src_b + 32'b1) : src_b); // ADD, SUB
        3'b001: res = src_a << shamt;   // SLL
        3'b010: res = sign_a < sign_b;  // SLT
        3'b011: res = src_a < src_b;    // SLTU
        3'b100: res = src_a ^ src_b;    // XOR
        3'b101: res = alt ? (sign_a >>> shamt) : (src_a >> shamt);  // SRA, SRL
        3'b110: res = src_a | src_b;    // OR
        3'b111: res = src_a & src_b;    // AND
    endcase
end

endmodule
