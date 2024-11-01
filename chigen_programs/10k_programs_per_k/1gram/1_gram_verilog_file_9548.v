// Seed: 3933412020
module module_0 (
    output uwire id_0,
    input  wire  id_1
);
  tri1 id_3;
  wand id_4 = {id_3, id_4, id_3 + 1};
  id_5(
      1'b0, id_1, id_0, id_4, id_4, id_4, 1 - 1, 1'b0, 1
  ); timeunit 1ps / 1ps;
endmodule
module module_1 (
    output wand  id_0,
    input  tri1  id_1,
    input  uwire id_2
);
  tri1 id_4;
  reg  id_5;
  assign id_4 = id_2;
  module_0(
      id_4, id_4
  );
  assign #1 id_5 = id_4 | 1;
  id_6 :
  assert property (@(negedge id_5) 1)
  else id_6 <= id_5;
endmodule
