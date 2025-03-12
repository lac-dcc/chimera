// Seed: 1926109433
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    input wand id_2,
    input tri0 id_3,
    input uwire id_4,
    input tri id_5,
    output supply0 id_6,
    input tri0 id_7,
    output wire id_8,
    input supply0 id_9,
    input wand id_10,
    input tri0 id_11,
    input uwire id_12,
    output supply0 id_13,
    input wor id_14
);
endmodule
module module_1 (
    input supply0 id_0,
    input supply0 id_1,
    input supply0 id_2,
    input tri1 id_3,
    input uwire id_4,
    input tri0 id_5,
    output tri0 id_6,
    input supply1 id_7,
    input supply1 id_8,
    input tri id_9,
    input wire id_10,
    output wire id_11,
    output tri1 id_12,
    output supply1 id_13,
    output tri1 id_14,
    input supply1 id_15,
    input uwire id_16,
    input tri0 id_17,
    input supply1 id_18
    , id_26,
    input wor id_19,
    input wand id_20,
    input tri0 id_21,
    input uwire id_22,
    output wor id_23,
    input uwire id_24
);
  assign id_6 = ~id_2 ? id_4 : id_3;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_5,
      id_9,
      id_8,
      id_18,
      id_14,
      id_8,
      id_23,
      id_0,
      id_18,
      id_5,
      id_8,
      id_6,
      id_22
  );
  assign modCall_1.id_13 = 0;
endmodule
