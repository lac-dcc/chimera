// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

module alu(
    
    /* Two register source operands */
    input wire [31:0]reg_source1,
    input wire [31:0]reg_source2,

    /* Immidiate source operand */
    input wire [31:0]imm_source,

    /* ALU immediate source operand flag */
    input wire imm,

    /* Operation opcode funct3 */
    input wire [2:0]funct3,

    /* Operation opcode funct7 */
    input wire [6:0]funct7,

    /* Result */
    output reg [31:0]res
);

reg signed [31:0]source1_signed = 0;
reg [31:0]source1  = 0;

reg signed [31:0]source2_signed = 0;
reg [31:0]source2  = 0;

initial res = 0;

always @(*) begin    
    
    source1_signed = reg_source1;
    source1        = reg_source1;

    source2_signed = (imm)? imm_source : reg_source2;
    source2        = (imm)? imm_source : reg_source2;

    case(funct3)
        3'b000: res = (!imm && funct7 == 32'h20)? source1 - source2 : source1 + source2;
        3'b001: res = reg_source1 << ((imm)? imm_source[4:0] : reg_source2);
        3'b010: res = (source1_signed < source2_signed);
        3'b011: res = (source1 < source2);
        3'b100: res = source1 ^ source2;
        3'b101: res = (funct7 == 32'h20)? (source1 >>> source2) : (source1 >> source2);
        3'b110: res = source1 | source2;
        3'b111: res = source1 & source2;
    endcase

end

endmodule
