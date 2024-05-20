// This program was cloned from: https://github.com/navin9212/RISC-V
// License: Apache License 2.0

//  module declaration
module imem(
    // inputs ports
    input clk,
    input reset,
    input wire IorD_reg, // selects between pc value and calculated address for memory writeback
    input wire MemWrite_reg, // enables to write data in IMEM
    input wire IRWrite_reg, // enables to write instruction in instruction register
    input wire [3:0] AluControl_reg, // specifies the particular instruction for data selection (load & store)
    input wire [31:0] pc_reg, // current pc value (address)
    input wire [31:0] AluOut_reg, // memory address calculated by ALU for writeback
    input wire [31:0] rsB_reg, // source register 2 content to be written in targeted memory location (s-type)
    // output ports
    output reg [31:0] addr_reg, // address on which IMEM will operate
    output reg [31:0] instruction_reg, // register storing instruction
    output reg [31:0] data_reg // register storing data for register writeback for load instruction
);

//  address selector block for "addr_reg" (selects between pc value and calculated address for memory writeback)
always @(pc_reg, AluOut_reg, IorD_reg) begin
    addr_reg <= IorD_reg ? AluOut_reg : pc_reg; // selects AluOut for IorD = 1 else pc_reg
end

reg [31:0] memory [0:(2**32/4)-1]; // defines memory array (length 32 bits, height 2^32 addresses/locations)

//  definition
always @(posedge clk or posedge reset) begin
    if (reset) begin
        instruction_reg <= 0;
        data_reg <= 0;
    end
    // instruction extraction block
    else if (IRWrite_reg) begin
        instruction_reg <= memory[addr_reg >> 2]; // writes instruction to instruction register for IRWrite = 1
    end
    // memory writeback block (S-type)
    else if (MemWrite_reg) begin // writes data to memory location if MemWrite is enabled
        case (AluControl_reg)
            4'b1000: memory[addr_reg >> 2][7:0] <= rsB_reg[7:0]; // sb (store the lower byte to memory at the calculated address)
            4'b1001: memory[addr_reg >> 2][15:0] <= rsB_reg[15:0]; // sh (store the lower halfword to memory at the calculated address)
            4'b1010: memory[addr_reg >> 2] <= rsB_reg; // sw (store the whole word to memory at the calculated address)
        endcase
    end
    // data extraction from memory for register writeback(I-type (load))
    else begin
        case (AluControl_reg)
            4'b1000: data_reg <= {{24{memory[addr_reg >> 2][7]}}, memory[addr_reg >> 2][7:0]}; // lb (load the lower byte of data at pointed address and sign extend)
            4'b1001: data_reg <= {{16{memory[addr_reg >> 2][15]}}, memory[addr_reg >> 2][15:0]}; // lh (load the lower halfword of data at pointed address and sign extend)
            4'b1010: data_reg <= memory[addr_reg >> 2]; // lw (load the whole word of data at pointed address)
            4'b1100: data_reg <= {24'b0, memory[addr_reg >> 2][7:0]}; // lbu (load the lower byte of data at pointed address and zero extend)
            4'b1101: data_reg <= {16'b0, memory[addr_reg >> 2][15:0]}; // lhu (load the lower halfword of data at pointed address and zero extend)
        endcase
    end
end
endmodule