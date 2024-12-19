// Seed: 3241751630
module module_0 (
    input wire id_0,
    input tri1 id_1,
    output wand id_2,
    input wor id_3,
    output wire id_4,
    input uwire id_5,
    output wire id_6,
    input uwire id_7,
    output tri1 id_8,
    output wire id_9,
    output supply1 id_10,
    input tri1 id_11,
    input tri id_12,
    output supply1 id_13,
    output wor id_14,
    output wor id_15
);
  wire id_17;
  wor  id_18;
  assign id_2 = id_11;
  wire id_19;
  integer id_20 (
      .id_0(id_13.id_18),
      .id_1(1),
      .id_2(1),
      .id_3(1),
      .id_4(id_17)
  );
  assign id_10 = 1;
endmodule
module module_1 (
    output wor   id_0,
    input  wire  id_1,
    input  wor   id_2,
    input  tri0  id_3,
    input  tri   id_4,
    output tri   id_5,
    output wor   id_6,
    output wor   id_7,
    input  wand  id_8,
    output wand  id_9,
    input  uwire id_10
);
  always if (id_8) id_5 = 1;
  tri0 id_12 = 1;
  assign id_6 = ~(1 < 1);
  module_0 modCall_1 (
      id_10,
      id_4,
      id_9,
      id_8,
      id_6,
      id_4,
      id_5,
      id_3,
      id_6,
      id_0,
      id_0,
      id_1,
      id_1,
      id_7,
      id_0,
      id_0
  );
  assign modCall_1.id_5 = 0;
endmodule
