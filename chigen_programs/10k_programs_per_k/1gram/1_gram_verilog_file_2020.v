// Seed: 959868911
module module_0 (
    output tri0 id_0,
    output wire id_1,
    input wor id_2,
    output tri0 id_3,
    input tri0 id_4,
    output wand id_5,
    output tri0 id_6,
    input wor id_7,
    input wor id_8,
    output supply0 id_9,
    input wor id_10,
    input wor id_11,
    input supply0 id_12,
    input tri1 id_13,
    output supply1 id_14,
    output tri0 id_15,
    output wand id_16
    , id_23,
    output uwire id_17,
    input wire id_18,
    output tri id_19,
    input wor id_20,
    input tri1 id_21
);
  assign id_9 = id_8;
  assign id_3 = id_21 & id_8;
endmodule
module module_1 (
    input wire id_0,
    output tri0 id_1,
    inout wor id_2,
    input supply0 id_3
    , id_8,
    input uwire id_4
    , id_9,
    input wire id_5,
    input wand id_6
);
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_4,
      id_1,
      id_4,
      id_2,
      id_1,
      id_4,
      id_0,
      id_1,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_6,
      id_0
  );
  assign id_9 = id_4 ? id_9 : 1;
endmodule
