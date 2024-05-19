// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//library ieee;
//use ieee.std_logic_1164.all;
//use ieee.std_logic_unsigned.all;

//-----------------------------------------------------
// Design Name : ram_dp_sr_sw
// File Name   : ram_dp_sr_sw.v
// Function    : Synchronous read write RAM
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------

`timescale 1ns/1ps

module blk_mem #(
  parameter DATA_WIDTH      = 8,
  parameter ADDRESS_WIDTH   = 4,
  parameter INC_NUM_PATTERN = 0
)(
  input                             clka,
  input                             wea,
  input   [ADDRESS_WIDTH - 1  :0]   addra,
  input   [DATA_WIDTH - 1:0]        dina,
  input                             clkb,
  input   [ADDRESS_WIDTH - 1:0]     addrb,
  output  [DATA_WIDTH - 1:0]        doutb
);

//Parameters
//Registers/Wires
reg [DATA_WIDTH - 1:0] mem [0:2 ** ADDRESS_WIDTH];
reg [DATA_WIDTH - 1:0] dout;

//Submodules
//Asynchronous Logic
assign doutb = dout;

//Synchronous Logic
//write only on the A side
`ifdef SIMULATION
integer i;
initial begin
  i = 0;
  for (i = 0; i < (2 ** ADDRESS_WIDTH); i = i + 1) begin
    if (INC_NUM_PATTERN) begin
        mem[i]  <=  i;
    end
    else begin
        //Zero Everything Out
        mem[i]  <=  0;
    end
  end
end
`endif

always @ (posedge clka)
begin
  if ( wea ) begin
     mem[addra] <= dina;
  end
end

//read only on the b side
always @ (posedge clkb)
begin
     dout <= mem[addrb];
end


endmodule

