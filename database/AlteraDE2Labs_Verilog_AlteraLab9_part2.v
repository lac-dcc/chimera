module part2 (CLOCK_50, SW, KEY, LEDR, LEDG, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);  
  input CLOCK_50;
  input [17:0] SW;
  input [3:0] KEY;
  output reg [17:0] LEDR;
  output [8:0] LEDG;
  output [0:6] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

  wire [15:0] DIN, BusWires;
  wire Resetn, Clock, Run, Done;

  //assign DIN = SW[15:0];
  //assign LEDR[15:0] = BusWires;
  //assign LEDR[15:0] = DIN;
  assign MClock = KEY[1];
  assign PClock = KEY[2];
  assign Run = SW[17];
  assign LEDG[8] = Done;
  assign Resetn = KEY[0];
  
  always
    if (SW[16])
      LEDR[15:0] = DIN;
    else
	  LEDR[15:0] = BusWires;
  
  assign LEDG[4:0] = addr;
  wire [4:0] addr;

  counter_modk C0 (MClock, Resetn, addr);
  defparam C0.n = 5;
  defparam C0.k = 32;
  romlpm R0 (addr, MClock, DIN);
  proc P0 (DIN, Resetn, PClock, Run, Done, BusWires);
  
  
  
  
  //part2module P0 (MClock, PClock, Resetn, Run, BusWires, Done);

  hex_ssd H0 (BusWires[3:0], HEX0);
  hex_ssd H1 (BusWires[7:4], HEX1);
  hex_ssd H2 (BusWires[11:8], HEX2);
  hex_ssd H3 (BusWires[15:12], HEX3);
endmodule
