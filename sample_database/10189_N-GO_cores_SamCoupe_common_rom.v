// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Miguel Angel Rodriguez Jodar
// 
// Create Date:    03:22:12 07/25/2015 
// Design Name:    SAM Coupé clone
// Module Name:    rom 
// Project Name:   SAM Coupé clone
// Target Devices: Spartan 6
// Tool versions:  ISE 12.4
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
(* rom_extract = "yes" *)
(* rom_style = "block" *)
module rom (
    input wire clk,
    input wire [14:0] a,
    output reg [7:0] dout
    );
    
    reg [7:0] mem[0:32767];
    initial begin
        $readmemh ("rom30.hex", mem);    
    end
    
    always @(posedge clk)
        dout <= mem[a];
endmodule
