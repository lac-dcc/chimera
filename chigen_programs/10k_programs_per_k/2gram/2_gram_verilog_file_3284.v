// Seed: 2609793542
module module_0 (
    input supply0 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input supply0 id_3,
    input tri1 id_4,
    input supply1 id_5,
    output tri1 id_6,
    input uwire id_7,
    output uwire id_8,
    input tri id_9,
    input wor id_10,
    input wand id_11,
    output supply0 id_12,
    output wor id_13,
    input wand id_14,
    output supply1 id_15,
    input tri1 id_16,
    input uwire id_17,
    input supply1 id_18,
    input tri0 id_19,
    input supply0 id_20,
    output wire id_21,
    input tri1 id_22,
    input wand id_23,
    input uwire id_24,
    input wor id_25
);
  wire id_27;
  assign id_13 = 1;
  wire id_28;
  wire id_29;
  wire id_30;
endmodule
module module_1 (
    output tri1 id_0,
    inout  wor  id_1,
    output wand id_2,
    output tri1 id_3,
    input  wand id_4
    , id_7,
    output tri0 id_5
);
  assign id_3 = id_1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_4,
      id_1,
      id_4,
      id_2,
      id_0,
      id_1,
      id_1,
      id_1,
      id_4,
      id_1,
      id_4,
      id_1,
      id_3,
      id_4,
      id_4,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
  wire id_8;
endmodule
