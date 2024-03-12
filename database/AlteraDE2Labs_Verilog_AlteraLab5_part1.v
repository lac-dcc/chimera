module part1 (KEY, LEDR);
  input [3:0] KEY;
  output [17:0] LEDR;

  counter_modk C1 (KEY[1], KEY[0], LEDR[3:0]);
  defparam C1.n = 4;
  defparam C1.k = 9;

  counter C2 (KEY[3], KEY[2], LEDR[17:12]);
  defparam C2.n = 6;
  defparam C1.k = 30;

endmodule
