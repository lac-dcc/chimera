// Seed: 3302519861
module module_0 (
    output uwire id_0,
    output tri1 id_1,
    input tri0 id_2,
    input tri1 id_3,
    input tri id_4,
    input tri0 id_5,
    output supply1 id_6,
    input tri0 id_7,
    output wire id_8,
    input tri0 id_9,
    input wire id_10,
    output wand id_11,
    input tri0 id_12,
    input supply0 id_13,
    input tri1 id_14,
    input wor id_15,
    input tri0 id_16,
    input supply1 id_17,
    output supply0 id_18,
    input supply1 id_19,
    input wor id_20,
    output tri1 id_21,
    output supply1 id_22,
    input wand id_23,
    input tri1 id_24,
    output supply0 id_25,
    input wire id_26
);
  wire id_28;
  assign id_18 = 1;
  wire id_29;
endmodule
module module_1 (
    output tri1 id_0,
    output tri id_1,
    input wor id_2,
    input uwire id_3,
    output wor id_4,
    input supply1 id_5,
    input tri1 id_6,
    output tri1 id_7,
    output tri1 id_8,
    output uwire id_9,
    input tri id_10,
    input tri id_11,
    input wor id_12
);
  assign id_1 = id_6;
  module_0 modCall_1 (
      id_0,
      id_7,
      id_6,
      id_5,
      id_11,
      id_12,
      id_7,
      id_12,
      id_4,
      id_5,
      id_5,
      id_0,
      id_6,
      id_5,
      id_5,
      id_12,
      id_2,
      id_11,
      id_7,
      id_2,
      id_6,
      id_1,
      id_0,
      id_10,
      id_11,
      id_1,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
