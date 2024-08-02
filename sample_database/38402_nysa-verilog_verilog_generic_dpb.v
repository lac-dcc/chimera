// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/*
  This code was adapted from
  http://danstrother.com/2010/09/11/inferring-rams-in-fpgas/
*/

//A parameterized inverable, dual-clock block ram


`timescale 1ns/1ps

module dpb #(
  parameter DATA_WIDTH = 32,
  parameter ADDR_WIDTH = 10,
  parameter MEM_FILE  = "NOTHING",
  parameter MEM_FILE_LENGTH = 0,
  parameter INITIALIZE = 0
) (
    input                             clka,
    input                             wea,
    input   wire  [ADDR_WIDTH - 1: 0] addra,
    input   wire  [DATA_WIDTH - 1: 0] dina,
    output  reg   [DATA_WIDTH - 1: 0] douta = 0,

    input                             clkb,
    input                             web,
    input   wire  [ADDR_WIDTH - 1: 0] addrb,
    input   wire  [DATA_WIDTH - 1: 0] dinb,
    output  reg   [DATA_WIDTH - 1: 0] doutb = 0
);

//Shared Memory
reg     [DATA_WIDTH - 1: 0]       mem [(1 << ADDR_WIDTH) - 1: 0];

integer i;
generate
if (MEM_FILE != "NOTHING") begin
  initial begin
    $readmemh(MEM_FILE, mem, 0, MEM_FILE_LENGTH - 1);
  end
end
else begin
  initial begin
    if (INITIALIZE == 1) begin
      for (i = 0; i < (1 << ADDR_WIDTH); i = i + 1) begin
        mem[i]      <= 0;
      end
    end
  end
end
endgenerate

//Port A
always @ (posedge clka) begin
  douta          <=              mem[addra];
  if (wea) begin
    douta        <=  dina;
    mem[addra]   <=  dina;
  end
end


//Port B
always @ (posedge clkb) begin
  doutb          <=              mem[addrb];
  if (web) begin
    doutb        <=              dinb;
    mem[addrb]   <=              dinb;
  end
end

endmodule
