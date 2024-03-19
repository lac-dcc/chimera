`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2020 07:12:43 PM
// Design Name: 
// Module Name: register
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


module register #(parameter ADDRESS_DEPTH=1000)(
    input wire i_clock,
    input wire [3:0] i_sel,
    input wire i_should_write,
    input wire [31:0] i_data,
    output reg [31:0] o_data
    );
    
reg [31:0] registers [ADDRESS_DEPTH-1:0];

always @(posedge i_clock)
begin
    if (i_should_write)
        registers[i_sel] <= i_data;

    o_data <= registers[i_sel];
end
endmodule