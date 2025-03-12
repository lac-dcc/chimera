// Seed: 2415865843
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    input wand id_2,
    input uwire id_3,
    input supply0 id_4,
    output uwire id_5
    , id_19,
    output tri1 id_6,
    input wand id_7,
    output supply0 id_8
    , id_20,
    input supply1 id_9,
    input tri1 id_10,
    input tri1 id_11,
    output tri0 id_12
    , id_21,
    output supply1 id_13,
    input tri id_14,
    input supply0 id_15,
    output tri0 id_16,
    input wire id_17
    , id_22
);
  assign id_5  = 1;
  assign id_16 = 1;
endmodule
module module_1 (
    output wor id_0
    , id_17,
    input tri id_1,
    input tri id_2,
    output tri1 id_3,
    input tri1 id_4,
    input wand id_5,
    output tri id_6,
    input supply0 id_7,
    input tri id_8,
    output tri1 id_9
    , id_18,
    output supply0 id_10,
    input tri0 id_11,
    input wire id_12,
    output uwire id_13,
    output wire id_14,
    input uwire id_15
);
  assign id_9 = id_11 * id_18 + id_1;
  module_0 modCall_1 (
      id_4,
      id_9,
      id_4,
      id_2,
      id_2,
      id_13,
      id_6,
      id_7,
      id_6,
      id_5,
      id_5,
      id_15,
      id_14,
      id_10,
      id_4,
      id_11,
      id_3,
      id_1
  );
  assign modCall_1.id_8 = 0;
endmodule
