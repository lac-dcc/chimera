// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License


`timescale 1ns/1ps


module sync_fifo #(
  parameter MEM_DEPTH   = 8,
  parameter DATA_WIDTH  = 32
)(
  input                           wr_clk,
  input                           rd_clk,
  input                           rst,

  output                          o_wr_full,
  //output  reg                     o_rd_empty,
  output                          o_rd_empty,

  input       [DATA_WIDTH - 1: 0] i_wr_data,
  input                           i_wr_stb,

  input                           i_rd_stb,
  output                          o_rd_last,
  output      [DATA_WIDTH - 1: 0] o_rd_data
);

//localparameters
localparam  MEM_SIZE = (2 ** (MEM_DEPTH));
//Registers/Wires
reg [DATA_WIDTH - 1: 0] mem[0:MEM_SIZE];
reg [MEM_DEPTH - 1: 0]      r_in_pointer;
reg [MEM_DEPTH - 1: 0]      r_out_pointer;
wire                        w_o_rd_empty;

wire  [MEM_DEPTH - 1: 0]    w_next_wr_addr;

//Submodules
//Asynchronous Logic
assign  w_next_wr_addr  = (r_in_pointer + 1) & (MEM_SIZE - 1);
//assign  w_o_rd_empty = (r_in_pointer == r_out_pointer);
assign  o_rd_empty = (r_in_pointer == r_out_pointer);
assign  o_rd_last  = ((r_out_pointer + 1) == r_in_pointer);
//assign  o_wr_full  = (r_out_pointer == 0) ? (r_in_pointer == (MEM_SIZE - 1)) : ((r_in_pointer + 1) == r_out_pointer);
assign  o_wr_full  = (w_next_wr_addr == r_out_pointer);
assign  o_rd_data  = mem[r_out_pointer];
//Synchronous Logic

always @ (posedge wr_clk) begin
  if (rst) begin
    r_in_pointer  <=  0;
  end
  else begin
    if (i_wr_stb) begin
      mem[r_in_pointer] <=  i_wr_data;
      if (!o_wr_full) begin
        r_in_pointer      <=  r_in_pointer + 1;
      end
    end
  end
end

always @ (posedge rd_clk) begin
  if (rst) begin
    r_out_pointer <=  0;
    //o_rd_empty         <=  1;
  end
  else begin
    //o_rd_empty               <=  w_o_rd_empty;
    if(i_rd_stb && !o_rd_empty) begin
      r_out_pointer     <=  r_out_pointer + 1;
    end
  end
end
 
endmodule
