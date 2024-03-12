`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:33:44 11/25/2016 
// Design Name: 
// Module Name:    bram 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module bram  # (
    parameter DATA=8,
    parameter ADDR=15
)(
    // Port A
    input   wire                a_clk,
    input   wire                a_en,
    input   wire                a_wr,
    input   wire    [ADDR-1:0]  a_addr,
    input   wire    [DATA-1:0]  a_din,
    output  wire    [DATA-1:0]  a_dout,
     
    // Port B
    input   wire                b_clk,
    input   wire                b_en,
    input   wire                b_wr,
    input   wire    [ADDR-1:0]  b_addr,
    input   wire    [DATA-1:0]  b_din,
    output  wire    [DATA-1:0]  b_dout


);

dpbram cpuram (
  .clka(a_clk), // input clka
  .ena(a_en), // input ena
  .wea(a_wr), // input [0 : 0] wea
  .addra(a_addr), // input [14 : 0] addra
  .dina(a_din), // input [7 : 0] dina
  .douta(a_dout), // output [7 : 0] douta
  .clkb(b_clk), // input clkb
  .enb(b_en), // input enb
  .web(b_wr), // input [0 : 0] web
  .addrb(b_addr), // input [14 : 0] addrb
  .dinb(b_din), // input [7 : 0] dinb
  .doutb(b_dout) // output [7 : 0] doutb
);

endmodule
