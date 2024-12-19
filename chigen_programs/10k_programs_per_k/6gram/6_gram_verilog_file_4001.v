// Seed: 2153948068
module module_0 (
    output uwire id_0,
    output uwire id_1,
    input wor id_2,
    input uwire id_3,
    output wor id_4,
    output uwire id_5,
    input tri id_6,
    input wand id_7,
    output uwire id_8,
    input supply0 id_9,
    input tri id_10,
    output tri id_11,
    input supply1 id_12,
    input wire id_13
    , id_31,
    input wire id_14,
    output tri1 id_15,
    input supply1 id_16
    , id_32,
    input wire id_17,
    input wor id_18,
    output supply0 id_19,
    input supply1 id_20,
    output wand id_21,
    output supply1 id_22,
    output supply0 id_23,
    input supply1 id_24,
    output tri id_25,
    input wor id_26,
    output tri1 id_27
    , id_33,
    input tri id_28,
    output wand id_29
);
  wire id_34;
  assign id_0 = 1;
  wire id_35;
  assign id_32 = id_28;
endmodule
module module_1 (
    input wand id_0,
    input tri0 id_1,
    output supply0 id_2
);
  always @(1 or posedge 1) id_2 = {1, id_1, id_0, 1};
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_0,
      id_2,
      id_2,
      id_1,
      id_0,
      id_2,
      id_1,
      id_1,
      id_2,
      id_0,
      id_0,
      id_1,
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.type_47 = 0;
endmodule
