// Seed: 1679961872
module module_0 (
    input wire id_0,
    input tri1 id_1,
    input supply1 id_2,
    input supply1 id_3,
    output tri id_4,
    input tri id_5,
    input supply0 id_6,
    input uwire id_7,
    input wire id_8,
    input tri1 id_9
    , id_31,
    output tri id_10,
    input wand id_11,
    input supply0 id_12,
    output wand id_13,
    output wor id_14,
    input wire id_15
    , id_32,
    input wire id_16,
    input tri0 id_17,
    input uwire id_18,
    output uwire id_19,
    input wor id_20,
    input wor id_21,
    output uwire id_22,
    input uwire id_23,
    input tri id_24,
    input wand id_25,
    input wire id_26,
    input wor id_27,
    output supply0 id_28,
    output supply1 id_29
);
endmodule
module module_1 (
    input uwire id_0,
    output uwire id_1,
    input tri id_2,
    input wire id_3,
    input supply1 id_4,
    inout supply1 id_5,
    input supply0 id_6,
    input supply0 id_7,
    output tri id_8
);
  assign id_1 = !id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_0,
      id_5,
      id_3,
      id_6,
      id_6,
      id_3,
      id_2,
      id_8,
      id_0,
      id_5,
      id_1,
      id_1,
      id_0,
      id_2,
      id_4,
      id_4,
      id_5,
      id_2,
      id_2,
      id_5,
      id_5,
      id_2,
      id_0,
      id_3,
      id_6,
      id_8,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
