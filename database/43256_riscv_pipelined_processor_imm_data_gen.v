// This program was cloned from: https://github.com/AuraGuardian23/riscv_pipelined_processor
// License: MIT License

`timescale 1ns / 1ps

module imm_data_gen(input [31:0] instruction, output reg [63:0] imm_data);

always @(*)
begin
case (instruction[6:5])
    2'b00: // I-Type
    begin
        imm_data[11:0] = instruction[31:20];
        imm_data[63:12] = (imm_data[11] == 1 ? 52'hf_ffff_ffff_ffff : 52'h0); 
    end
    2'b01: // S-Type
    begin
        imm_data[11:0] = {instruction[31:25], instruction[11:7]};
        imm_data[63:12] = (imm_data[11] == 1 ? 52'hf_ffff_ffff_ffff : 52'h0); 
    end
    
    default: // Conditional Branch
    begin
        imm_data[12:1] = {instruction[31], instruction[7], instruction[30:25], instruction[11:8]};
        imm_data[63:13] = (imm_data[12] == 1 ? 51'hf_ffff_ffff_ffff : 51'h0); 
        imm_data[0] = 1'b0;
    end
endcase 
end
endmodule
