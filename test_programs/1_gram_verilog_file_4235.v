// Seed: 4132577399
module module_0 (
    input wand id_0,
    input tri1 id_1,
    input wire id_2,
    output tri0 id_3,
    input tri1 id_4,
    input wand id_5,
    output tri0 id_6,
    input tri0 id_7,
    output wor id_8,
    output supply0 id_9,
    input tri0 id_10,
    input supply1 id_11,
    input uwire id_12,
    output tri1 id_13,
    input supply1 id_14,
    output tri1 id_15,
    input supply0 id_16,
    input supply1 id_17,
    input uwire id_18,
    input tri0 id_19,
    output wor id_20,
    input tri id_21
);
  wire id_23;
  wire id_24;
  wire id_25;
  wire id_26, id_27, id_28;
  `define pp_29 0
endmodule
module module_1 (
    input wand id_0,
    output tri0 id_1,
    output tri0 id_2,
    output uwire id_3,
    output supply1 id_4,
    input tri id_5,
    output supply1 id_6,
    input tri id_7,
    input supply0 id_8,
    input wor id_9,
    input tri0 id_10,
    input tri id_11,
    input supply1 id_12
);
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_3,
      id_11,
      id_12,
      id_4,
      id_12,
      id_6,
      id_3,
      id_5,
      id_0,
      id_0,
      id_2,
      id_8,
      id_4,
      id_7,
      id_8,
      id_7,
      id_7,
      id_6,
      id_11
  );
  assign modCall_1.type_0 = 0;
endmodule
