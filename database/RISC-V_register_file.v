// This program was cloned from: https://github.com/navin9212/RISC-V
// License: Apache License 2.0

//  module declaration
module register_file(
    // inputs ports
    input clk,
    input reset,
    input wire [1:0] MtoR_reg, // selects data among load, R and U type instruction for register writeback
    input wire RegWrite_reg, // enables to write data in register file
    input wire AluSrcA_reg, // selects data between pc value and source register 1 data
    input wire [1:0] AluSrcB_reg, // selects among constant value 4, source register 2 data and immediate data
    input wire [4:0] rs1_reg, // defines source register 1
    input wire [4:0] rs2_reg, // defines source register 2
    input wire [4:0] rd_reg, // defines destination register
    input wire [31:0] data_reg, // register storing data for register writeback for load instruction
    input wire [31:0] AluOut_reg, // register storing ALU result
    input wire [31:0] pc_reg, // current pc value (address)
    input wire [31:0] Imm_reg, // immediate data or offset
    // output ports
    output reg [31:0] wr_data_reg, // data to be written in destination register
    output reg [31:0] rsA_reg, // source register 1 content
    output reg [31:0] rsB_reg, // source register 2 content
    output reg [31:0] SrcA_reg, // source operand 1
    output reg [31:0] SrcB_reg // source operand 2
);

//  data selector block for "wr_data_reg" (selects between data, AluOut and immediate value for register writeback)
always @(MtoR_reg, data_reg, AluOut_reg, Imm_reg) begin
    case (MtoR_reg)
        2'b00: wr_data_reg <= AluOut_reg; // R-type, I-type (arithmetic, logical, shift)
        2'b01: wr_data_reg <= data_reg; // I-type (load)
        2'b10: wr_data_reg <= Imm_reg; // U-type (lui)
    endcase
end

//  source operand 1 selector for "SrcA_reg" (selects between pc value and rsA for ALU)
always @(AluSrcA_reg, rsA_reg, pc_reg) begin
    SrcA_reg <= AluSrcA_reg ? rsA_reg : pc_reg; // selects rsA for AluSrcA = 1, else pc
end

//  source operand 2 selector for "SrcB_reg" (selects between constant value "4", Imm and rsB for ALU)
always @(AluSrcB_reg, rsB_reg, Imm_reg) begin
    case (AluSrcB_reg)
        2'b00: SrcB_reg <= rsB_reg; // R-type, B-type
        2'b01: SrcB_reg <= 4; // fetch cycle
        2'b10: SrcB_reg <= Imm_reg; // I-type, J-type, B-type, U-type (auipc)
    endcase
end

reg [31:0] register [0:31]; // defines register file (length 32 bits, height 32 locations)

//  definition
always @(posedge clk or posedge reset) begin
    if (reset) begin
        rsA_reg <= 0;
        rsB_reg <= 0;
    end
    // register writeback block (R-type, I-type(shift, logical, arithmetic, jump, load))
    else if (RegWrite_reg == 1'b1) begin
        register[rd_reg] <= wr_data_reg;
    end
    // register read block (R-type, B-type)
    else begin
        rsA_reg <= register[rs1_reg];
        rsB_reg <= register[rs2_reg];
    end
end
endmodule