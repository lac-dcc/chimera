module ram_memory(
  input clk,
  input [ADDR_WIDTH-1:0] addr,
  input [7:0] data_in,
  input rd,
  input we,
  output reg [7:0] data_out
);
  parameter integer ADDR_WIDTH = 8;

  reg [7:0] ram[0:(2 ** ADDR_WIDTH)-1] /* verilator public_flat */;
  
  parameter FILENAME = "";

  initial
  begin
    if (FILENAME!="")
		  $readmemh(FILENAME, ram);
  end

  always @(posedge clk)
  begin
    if (we)
      ram[addr] <= data_in;
    if (rd)
      data_out <= ram[addr];
  end
endmodule
