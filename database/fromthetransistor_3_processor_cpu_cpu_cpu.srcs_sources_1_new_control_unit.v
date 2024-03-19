`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2020 09:41:20 AM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input wire i_clock,
    input wire i_decode_en,
    input wire i_alu_en,
    input wire i_writer_en,
    input wire i_fetch_en,
    output reg o_decode_en,
    output reg o_alu_en,
    output reg o_writer_en,
    output reg o_fetch_en
    );

// decode -> alu -> write -> fetch next inst

always @(posedge i_clock)
begin
    if (!i_decode_en)
    begin
        o_decode_en <= 1;
        o_alu_en <= 1;
    end
    if (!i_alu_en)
    begin
        o_alu_en <= 1;
        o_writer_en <= 1;
    end
    if (!i_writer_en)
    begin
        o_writer_en <= 1;
        o_fetch_en <= 1;
    end
    if (!i_fetch_en)
    begin
        o_fetch_en <= 1;
        o_decode_en <= 1;
    end
    
end
endmodule
