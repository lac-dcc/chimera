module part3 (SW, KEY, LEDR, LEDG, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
  input [17:0] SW;
  input [3:0] KEY;
  output [17:0] LEDR;
  output [8:0] LEDG;
  output [0:6] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
  
  wire [7:0] din;
  reg [7:0] dout;
  wire [4:0] addr;
  wire wren, clock;

  assign din = SW[7:0];
  assign wren = SW[17];
  assign clock = KEY[0];
  assign addr = SW[15:11];
  assign LEDR[7:0] = dout;
  assign LEDG[0] = wren;

  reg [7:0] memory_array [31:0];
  always @(posedge clock) begin
    if (wren)
      memory_array[addr] <= din;
    dout <= memory_array[addr];
  end

  hex_ssd H7 (addr[4], HEX7);
  hex_ssd H6 (addr[3:0], HEX6);
  hex_ssd H5 (din[7:4], HEX5);
  hex_ssd H4 (din[3:0], HEX4);
  hex_ssd H3 (0, HEX3);
  hex_ssd H2 (0, HEX2);
  hex_ssd H1 (dout[7:4], HEX1);
  hex_ssd H0 (dout[3:0], HEX0);
endmodule
