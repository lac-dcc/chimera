module part1 (SW, LEDR);
  input [17:0] SW;
  output [17:0] LEDR;
  
  wire [7:0] din, dout;
  wire [4:0] addr;
  wire wren, clock;

  assign din = SW[7:0];
  assign wren = SW[8];
  assign clock = SW[9];
  assign addr = SW[14:10];
  assign LEDR[7:0] = dout;

  ramlpm R0 (addr, clock, din, wren, dout);

endmodule
