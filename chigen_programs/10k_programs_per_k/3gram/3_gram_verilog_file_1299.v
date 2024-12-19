// Seed: 266052514
module module_0 (
    input tri id_0,
    input supply0 id_1,
    input uwire id_2,
    output tri id_3,
    input supply1 id_4,
    input wire id_5,
    input wire id_6,
    output tri1 id_7,
    output uwire id_8,
    input uwire id_9,
    input wor id_10,
    output wor id_11,
    output uwire id_12,
    output uwire id_13,
    input tri id_14,
    output wand id_15
);
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    input  tri0  id_1,
    output uwire id_2,
    input  tri   id_3,
    input  wor   id_4,
    input  wand  id_5,
    input  wand  id_6,
    inout  wire  id_7,
    input  wor   id_8
);
  tri0 id_10;
  supply1 id_11;
  assign id_10 = id_3;
  assign id_7  = 1'b0;
  assign id_11 = id_10;
  wire id_12;
  if (1) id_13(.id_0(id_11), .id_1(1), .id_2(id_8));
  else assign id_2 = 1;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_7,
      id_2,
      id_11,
      id_8,
      id_6,
      id_10,
      id_10,
      id_7,
      id_1,
      id_0,
      id_0,
      id_7,
      id_7,
      id_0
  );
endmodule
