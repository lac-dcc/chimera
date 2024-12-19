// Seed: 3660869556
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input wand id_2,
    input supply1 id_3,
    output supply0 id_4,
    output supply1 id_5,
    input supply1 id_6,
    input wire id_7,
    input wand id_8,
    output tri id_9,
    output uwire id_10,
    input uwire id_11,
    output wor id_12,
    input wor id_13
);
  wire  id_15;
  uwire id_16;
  wire  id_17;
  assign id_16 = id_6 - id_1;
  tri id_18, id_19 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    input tri0 id_2,
    output wor id_3,
    output wire id_4,
    input tri0 id_5,
    output tri id_6,
    output wand id_7,
    input supply1 id_8,
    input wand id_9,
    input tri1 id_10,
    output tri id_11,
    input uwire id_12,
    output wand id_13
);
  assign id_7 = 1;
  wire id_15, id_16;
  module_0 modCall_1 (
      id_9,
      id_10,
      id_2,
      id_5,
      id_13,
      id_3,
      id_8,
      id_12,
      id_0,
      id_11,
      id_3,
      id_8,
      id_6,
      id_10
  );
  assign modCall_1.id_6 = 0;
endmodule
