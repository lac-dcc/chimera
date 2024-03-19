`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2020 05:13:38 PM
// Design Name: 
// Module Name: rom
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

module rom #(parameter ADDRESS_DEPTH=1000)(
    input wire i_clock, // TODO: remove clock
    input wire [19:0] i_memory_address,
    output reg [31:0] o_data
    );
    
reg [31:0] memory [ADDRESS_DEPTH-1:0];

always @(posedge i_clock)
begin
    memory[20'b00000000000000000000] <= 32'b00000000000000000000000000000011;
    memory[20'b00000000000000000001] <= 32'b00000000000000000000000000000010;
    memory[20'b00000000000000000010] <= 32'b00000000000000000000000000000001;

    o_data <= memory[i_memory_address];
end

endmodule
