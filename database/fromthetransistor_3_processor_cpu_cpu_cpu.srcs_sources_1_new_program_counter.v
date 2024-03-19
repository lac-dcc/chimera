`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2020 07:20:02 PM
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

/*
(
    .i_clock(clock),
    .i_next_inst_addr(inst_next_inst_addr),
    .i_should_jump(inst_should_jump),
    .i_should_reset(inst_should_reset),
    .o_instruction_addr(pc_out_inst_addr)
);
*/
module program_counter(
    input wire i_clock,
    input wire [31:0] i_next_inst_addr,
    input wire i_should_jump,
    input wire i_should_reset,
    output reg [31:0] o_instruction_addr
    );
    
always @(posedge i_clock)
begin
    if (i_should_reset)
        o_instruction_addr <= 0;
    else if (i_should_jump)
        o_instruction_addr <= i_next_inst_addr;
    else
        o_instruction_addr <= o_instruction_addr + 1;
end
endmodule
