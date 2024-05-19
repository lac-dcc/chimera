// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/*
  This code was adapted from
  http://danstrother.com/2010/09/11/inferring-rams-in-fpgas/
*/

//A parameterized inverable, dual-clock block ram



module dual_port_bram #(
  parameter DATA_WIDTH = 32,
  parameter ADDR_WIDTH = 10,
  parameter MEM_FILE  = "NOTHING",
  parameter MEM_FILE_LENGTH = 0
) (
  //Port A
  a_clk,
  a_wr,
  a_addr,
  a_din,
  a_dout,

  b_clk,
  b_wr,
  b_addr,
  b_din,
  b_dout
);

input                             a_clk;
input                             a_wr;
input   wire  [ADDR_WIDTH - 1: 0] a_addr;
input   wire  [DATA_WIDTH - 1: 0] a_din;
output  reg   [DATA_WIDTH - 1: 0] a_dout;

input                             b_clk;
input                             b_wr;
input   wire  [ADDR_WIDTH - 1: 0] b_addr;
input   wire  [DATA_WIDTH - 1: 0] b_din;
output  reg   [DATA_WIDTH - 1: 0] b_dout;

//Shared Memory
reg     [DATA_WIDTH - 1: 0]       mem [(1 << ADDR_WIDTH) - 1: 0];

generate
if (MEM_FILE != "NOTHING") begin
initial begin
    $readmemh(MEM_FILE, mem, 0, MEM_FILE_LENGTH - 1);
end
end
endgenerate

//Port A
always @ (posedge a_clk) begin
  a_dout          <=              mem[a_addr];
  if (a_wr) begin
    a_dout        <=  a_din;
    mem[a_addr]   <=  a_din;
  end
end


//Port B
always @ (posedge b_clk) begin
  b_dout          <=              mem[b_addr];
  if (b_wr) begin
    b_dout        <=              b_din;
    mem[b_addr]   <=              b_din;
  end
end

endmodule
