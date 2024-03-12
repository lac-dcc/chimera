`timescale 1ns / 1ps

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
  .clock_a(a_clk), // input clka
  .rden_a(a_en), // input ena
  .wren_a(a_wr), // input [0 : 0] wea
  .address_a(a_addr), // input [14 : 0] addra
  .data_a(a_din), // input [7 : 0] dina
  .q_a(a_dout), // output [7 : 0] douta
  .clock_b(b_clk), // input clkb
  .rden_b(b_en), // input enb
  .wren_b(b_wr), // input [0 : 0] web
  .address_b(b_addr), // input [14 : 0] addrb
  .data_b(b_din), // input [7 : 0] dinb
  .q_b(b_dout) // output [7 : 0] doutb
);

endmodule