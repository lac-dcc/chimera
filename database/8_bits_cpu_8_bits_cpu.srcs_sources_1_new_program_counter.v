// This program was cloned from: https://github.com/buttfa/8_bits_cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/11 14:42:00
// Design Name: 
// Module Name: program_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module program_counter(
        input rst,
        input pc_en,
        input jump_en,
        input [7:0] jump_addr,
        input [3:0] ins_code,
        input [7:0] ac_out,
        input [7:0] reg_out,
        input [7:0] instruct,

        output reg [7:0] pc_addr,
        output [7:0] command,
        output [7:0] addr
    );

    parameter 
        B   = 4'b0001,
        BEQ = 4'b0010,
        BLT = 4'b0011;


    always @(negedge rst or posedge pc_en or posedge jump_en) begin
        if (!rst) begin
            pc_addr <= 8'b0000_0000;
        end else if (pc_en) begin
            pc_addr <= pc_addr + 8'b0000_0001;
        end else if (jump_en) begin
            case (ins_code)
                B: begin
                    pc_addr <= jump_addr;
                end 
                BEQ: begin
                    if (ac_out == reg_out) begin
                        pc_addr <= jump_addr;
                    end else begin
                        pc_addr <= pc_addr;
                    end
                end
                BLT: begin
                    if (ac_out < reg_out) begin
                        pc_addr <= jump_addr;
                    end else begin
                        pc_addr <= pc_addr;
                    end
                end
                default: pc_addr <= pc_addr;
            endcase
        end
    end

    // 对从ROM中取出的数据做不同的解释
    assign command = instruct;
    assign addr = instruct;
endmodule
