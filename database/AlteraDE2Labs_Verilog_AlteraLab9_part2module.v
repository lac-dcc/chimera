module part2module (MClock, PClock, Resetn, Run, BusWires, Done);
  input MClock, PClock, Resetn, Run;
  output [15:0] BusWires;
  output Done;

  wire [15:0] DIN;
  wire [4:0] addr;

  counter_modk C0 (MClock, Resetn, addr);
  defparam C0.n = 5;
  defparam C0.k = 32;

  romlpm R0 (addr, MClock, DIN);


  proc P0 (DIN, Resetn, PClock, Run, Done, BusWires);

endmodule
