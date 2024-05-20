// This program was cloned from: https://github.com/buttfa/8_bits_cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/11 14:52:50
// Design Name: 
// Module Name: instruction_register
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


module instruction_register(
        input rst,
        input ir_en,
        input [7:0] command,

        output reg [3:0] ins_code,
        output reg [3:0] reg_addr
    );

    always @(negedge rst or posedge ir_en) begin
        if (!rst) begin
            ins_code <= 4'bZZZZ;
            reg_addr <= 4'bZZZZ;
        end else if (ir_en) begin
            ins_code <= {command[7],command[6],command[5],command[4]};
            reg_addr <= {command[3],command[2],command[1],command[0]};
        end
    end

endmodule
