// Seed: 73449809
module module_0 (
    input  wor   id_0,
    input  tri0  id_1,
    output tri0  id_2,
    input  wire  id_3,
    input  wor   id_4,
    output wand  id_5#(.id_15(-1), .id_16(-1'b0), .id_17(1), .id_18(1'b0)),
    output wor   id_6,
    input  tri0  id_7,
    output tri0  id_8,
    input  wand  id_9,
    input  uwire id_10,
    output wire  id_11,
    input  tri   id_12,
    output wor   id_13
);
  assign id_2 = -1;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    output wire id_0,
    input uwire id_1,
    output uwire id_2,
    output supply1 id_3,
    input tri id_4,
    input tri id_5,
    input wor id_6,
    output uwire id_7,
    output wor id_8,
    output supply0 id_9
);
  assign id_0 = id_6;
  assign id_8 = id_1;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_8,
      id_1,
      id_5,
      id_0,
      id_7,
      id_1,
      id_2,
      id_1,
      id_1,
      id_3,
      id_6,
      id_3
  );
  assign id_2 = id_4;
endmodule
