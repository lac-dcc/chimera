`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2020 10:57:14 AM
// Design Name: 
// Module Name: ram
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


module ram #(parameter ADDRESS_DEPTH=1000)(
    input wire i_clock, // TODO: Remove clock
    input wire [19:0] i_memory_address,
    input wire i_should_write,
    input wire [31:0] i_data,
    output reg [31:0] o_data
    );
    
reg [31:0] memory [ADDRESS_DEPTH-1:0];


always @(posedge i_clock)
begin
    if (i_should_write == 1'b1)
    begin
        memory[i_memory_address] <= i_data;
    end
    
    o_data <= memory[i_memory_address];
end

endmodule
