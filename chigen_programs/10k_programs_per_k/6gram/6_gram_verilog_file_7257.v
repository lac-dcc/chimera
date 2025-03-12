// Seed: 2037755622
module module_0 (
    input supply0 id_0,
    input wire id_1,
    input tri0 id_2,
    input uwire id_3,
    input wand id_4,
    input supply0 id_5,
    output tri1 id_6,
    output tri id_7,
    input tri id_8,
    output wand id_9,
    input tri0 id_10,
    input uwire id_11,
    output tri0 id_12,
    input wor id_13,
    output tri0 id_14,
    input uwire id_15,
    input tri1 id_16,
    output supply0 id_17,
    input wor id_18,
    input tri1 id_19,
    input supply1 id_20,
    input tri1 id_21,
    input uwire id_22,
    input supply1 id_23,
    input tri1 id_24,
    output tri1 id_25,
    output tri id_26,
    input supply0 id_27,
    input tri0 id_28,
    input supply1 id_29,
    output tri1 id_30,
    output supply0 id_31
);
  assign id_6 = id_5;
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    input supply0 id_2,
    output supply1 id_3,
    output wand id_4
);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_1,
      id_3,
      id_4,
      id_1,
      id_4,
      id_2,
      id_1,
      id_3,
      id_0,
      id_3,
      id_0,
      id_1,
      id_3,
      id_0,
      id_0,
      id_1,
      id_0,
      id_2,
      id_0,
      id_1,
      id_4,
      id_3,
      id_1,
      id_0,
      id_2,
      id_4,
      id_4
  );
  assign modCall_1.id_20 = 0;
  localparam id_6 = 1;
  assign id_4#(.id_2(-1)) = id_1;
endmodule
