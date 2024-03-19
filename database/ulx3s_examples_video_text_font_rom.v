module font_rom(
  input clk,
  input [11:0] addr,
  output reg [7:0] data_out
);

  reg [7:0] store[0:4095];

  initial
  begin
    $readmemh("font_vga.mem", store);
  end

  always @(posedge clk) 
    data_out <= store[addr];
endmodule
