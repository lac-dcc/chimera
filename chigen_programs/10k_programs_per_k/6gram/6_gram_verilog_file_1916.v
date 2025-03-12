// Seed: 3469616631
module module_0 (
    input wand id_0,
    input tri1 id_1,
    output uwire id_2,
    input tri0 id_3,
    input tri0 id_4,
    input uwire id_5,
    output supply1 id_6,
    input supply1 id_7,
    output tri0 id_8,
    output tri0 id_9,
    input tri0 id_10,
    output tri1 id_11
    , id_22,
    input uwire id_12,
    input wire id_13,
    input tri0 id_14
    , id_23,
    input supply1 id_15,
    input supply0 id_16,
    output tri id_17,
    input supply1 id_18,
    input tri0 id_19,
    output wand id_20
);
  integer id_24;
endmodule
module module_1 (
    input tri1 id_0,
    input tri id_1,
    output uwire id_2,
    output wire id_3,
    input wand id_4,
    input tri0 id_5,
    input supply0 id_6,
    input wire id_7,
    output tri0 id_8,
    output wor id_9
);
  assign id_2 = 1'b0;
  assign id_9 = 1;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_8,
      id_1,
      id_5,
      id_6,
      id_2,
      id_1,
      id_2,
      id_9,
      id_1,
      id_3,
      id_6,
      id_1,
      id_5,
      id_4,
      id_6,
      id_3,
      id_4,
      id_7,
      id_3
  );
  assign modCall_1.id_15 = 0;
  nor primCall (id_3, id_1, id_5);
  wire id_11;
endmodule
