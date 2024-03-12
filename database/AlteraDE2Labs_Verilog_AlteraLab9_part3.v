module part3 (CLOCK_50, SW, KEY, LEDR, LEDG, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);  
  input CLOCK_50;
  input [17:0] SW;
  input [3:0] KEY;
  output reg [17:0] LEDR;
  output [8:0] LEDG;
  output [0:6] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

  wire [15:0] DIN, BusWires, ADDR, DOUT, LEDsOUT;
  wire Resetn, Clock, Run, Done, W;
  
  reg LEDen, MEMen;

  //assign DIN = SW[15:0];
  //assign LEDR[15:0] = BusWires;
  //assign LEDR[15:0] = DIN;
  wire [25:0] newclock;
  counter_modk C_new (CLOCK_50, 1, newclock);
  defparam C_new.n = 26;
  defparam C_new.k = 50000000;
  //assign MClock = newclock[25];//CLOCK_50; //KEY[1];
  //assign PClock = ~newclock[25];//CLOCK_50; //KEY[2];
  assign MClock = KEY[1];
  assign PClock = KEY[2];
  assign Run = SW[17];
  assign LEDG[8] = Done;
  assign Resetn = KEY[0];
  
  wire [15:0] R0;
  always
    if (SW[16])
      LEDR[15:0] = DIN;
    else
      LEDR[15:0] = R0;
  

  always
  begin
    //LEDen = W;
    //MEMen = W;
    LEDen = W & ~(ADDR[15] | ADDR[14] | ADDR[13] | ~ADDR[12]);
    MEMen = W & ~(ADDR[15] | ADDR[14] | ADDR[13] | ADDR[12]);
  end

  proc2 P0 (DIN, Resetn, PClock, Run, Done, BusWires, ADDR, DOUT, W, LEDG[2:0], R0);
  regn LEDs (DOUT, LEDen, MClock, LEDsOUT);
  ramlpm Memory (ADDR, MClock, DOUT, MEMen, DIN);
  
  
  
  
  //part2module P0 (MClock, PClock, Resetn, Run, BusWires, Done);

  hex_ssd H0 (BusWires[3:0], HEX0);
  hex_ssd H1 (BusWires[7:4], HEX1);
  hex_ssd H2 (BusWires[11:8], HEX2);
  hex_ssd H3 (BusWires[15:12], HEX3);

  hex_ssd H4 (ADDR[3:0], HEX4);
  hex_ssd H5 (ADDR[7:4], HEX5);
  hex_ssd H6 (ADDR[11:8], HEX6);
  hex_ssd H7 (ADDR[15:12], HEX7);

endmodule
