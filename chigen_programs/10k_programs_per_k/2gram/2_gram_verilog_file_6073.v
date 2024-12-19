// Seed: 1228452934
module module_0 (
    output wire id_0,
    output tri1 id_1,
    output wand id_2,
    input supply1 id_3,
    output wire id_4,
    output tri1 id_5,
    output supply0 id_6
);
  assign id_4 = 'd0;
  assign id_6 = 1;
  assign id_1 = id_3 * 1;
  reg id_8;
  assign module_1.id_1 = 0;
  wire id_9;
  wire id_10;
  supply0 id_11;
  always id_8 <= 1 == id_3;
  id_12 :
  assert property (@(negedge 1) id_11)
  else;
endmodule
module module_1 (
    output tri0  id_0,
    input  wire  id_1,
    input  tri0  id_2,
    input  uwire id_3,
    input  tri   id_4,
    inout  tri0  id_5
);
  wire id_7;
  nand primCall (id_5, id_1, id_8, id_7, id_3, id_4, id_2);
  wire id_8;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_5,
      id_1,
      id_7,
      id_7,
      id_5
  );
  assign id_5 = 1;
  assign id_7 = id_5;
  assign id_7 = 1;
endmodule
