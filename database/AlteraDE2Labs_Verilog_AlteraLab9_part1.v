module part1 (CLOCK_50, SW, KEY, LEDR, LEDG, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);  
  input CLOCK_50;
  input [17:0] SW;
  input [3:0] KEY;
  output [17:0] LEDR;
  output [8:0] LEDG;
  output [0:6] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

  wire [15:0] DIN, BusWires;
  wire Resetn, Clock, Run, Done;

  assign DIN = SW[15:0];
  assign LEDR[15:0] = BusWires;
  assign Clock = KEY[1];
  assign Run = SW[17];
  assign LEDG[8] = Done;
  assign Resetn = KEY[0];

  proc P0 (DIN, Resetn, Clock, Run, Done, BusWires);

  hex_ssd H0 (BusWires[3:0], HEX0);
  hex_ssd H1 (BusWires[7:4], HEX1);
  hex_ssd H2 (BusWires[11:8], HEX2);
  hex_ssd H3 (BusWires[15:12], HEX3);
endmodule
