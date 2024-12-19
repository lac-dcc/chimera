// Seed: 3181910329
module module_0 (
    output supply0 id_0,
    output wand id_1,
    input wire id_2,
    output tri0 id_3,
    output uwire id_4,
    output supply0 id_5
);
  wire id_7, id_8;
  assign module_1.id_2 = 0;
  integer id_9 (.id_0(id_5));
  assign id_0 = id_2;
endmodule
module module_1 (
    input  tri0  id_0,
    input  wire  id_1,
    input  wand  id_2,
    input  tri   id_3,
    output wand  id_4,
    input  uwire id_5,
    input  tri0  id_6,
    input  logic id_7,
    output logic id_8
);
  wor id_10;
  id_11 :
  assert property (@(posedge 1) id_6 * 1 & id_7)
    if (1) id_8 <= id_7;
    else if (id_10.id_1) id_10 = 1;
    else id_4 -= id_0;
  assign id_8 = 1;
  wire id_12;
  wire id_13, id_14;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4
  );
  assign id_11 = 1;
endmodule
