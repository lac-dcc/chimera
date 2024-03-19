`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2022 11:25:38 PM
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

module ram
#(
parameter RAM_WIDTH = 8,                    // Specify RAM data width
parameter RAM_DEPTH = 4                     // Specify RAM depth (number of entries)
) 
(
input clk,                               // Clock
input we_i,                              // Write enable
input [clogb2(RAM_DEPTH-1)-1:0] addr_i,  // Address bus, width determined from RAM_DEPTH
input [RAM_WIDTH-1:0] din_i,             // RAM input data
output [RAM_WIDTH-1:0] dout_o            // RAM output data
);

// block, distributed, registers, auto
(* ram_style="auto" *)

reg [RAM_WIDTH-1:0] BRAM [RAM_DEPTH-1:0];
reg [RAM_WIDTH-1:0] ram_data = {RAM_WIDTH{1'b0}};

always @(posedge clk) begin
    // write
    if (we_i == 1'b1) begin
        BRAM[addr_i]    <= din_i;        
    end
    // read
    ram_data        <= BRAM[addr_i];
end

assign dout_o = ram_data;

//  The following function calculates the address width based on specified RAM depth
function integer clogb2;
input integer depth;
  for (clogb2=0; depth>0; clogb2=clogb2+1)
    depth = depth >> 1;
endfunction

endmodule