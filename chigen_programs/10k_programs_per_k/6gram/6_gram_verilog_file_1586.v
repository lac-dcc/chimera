// Seed: 1314354157
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    output tri0 id_3,
    input wor id_4,
    output wor id_5,
    output wire id_6,
    output tri1 id_7
    , id_15,
    input uwire id_8,
    input supply1 id_9,
    input supply0 id_10,
    input supply1 id_11,
    input supply0 id_12,
    output wand id_13
);
endmodule
module module_1 (
    input wire id_0,
    output uwire id_1,
    input uwire id_2,
    input uwire id_3,
    output uwire id_4,
    input uwire id_5,
    input supply0 id_6,
    input wand id_7,
    output tri id_8,
    input wire id_9,
    input wand id_10,
    output wand id_11,
    output uwire id_12,
    input wand id_13,
    output tri0 id_14,
    output supply1 id_15
);
  wire id_17;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_3,
      id_12,
      id_13,
      id_4,
      id_8,
      id_12,
      id_2,
      id_7,
      id_9,
      id_9,
      id_10,
      id_12
  );
  assign modCall_1.id_13 = 0;
  assign id_14 = id_13 == id_10 ? 1 : ({1, id_3 - 1, 1'b0}) + id_6;
endmodule
