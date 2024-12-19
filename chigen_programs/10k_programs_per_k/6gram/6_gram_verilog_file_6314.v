// Seed: 963343566
module module_0 (
    output tri1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    input uwire id_3,
    output tri0 id_4,
    input wor id_5
    , id_19,
    input supply1 id_6,
    output wire id_7,
    input wire id_8,
    input wire id_9,
    output wire id_10,
    input tri0 id_11,
    input wor sample,
    input tri0 id_13
    , id_20,
    output wand id_14,
    input supply1 module_0,
    input wor id_16,
    input wire id_17
);
  assign id_4 = id_19 ? {~id_19, 1'h0} : id_20;
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    input uwire id_2,
    input uwire id_3,
    input wor id_4
    , id_7,
    output wor id_5
);
  uwire id_8;
  assign id_7 = id_1;
  module_0 modCall_1 (
      id_8,
      id_0,
      id_4,
      id_0,
      id_7,
      id_4,
      id_1,
      id_7,
      id_3,
      id_3,
      id_7,
      id_8,
      id_7,
      id_3,
      id_7,
      id_2,
      id_0,
      id_8
  );
  assign modCall_1.type_5 = 0;
  assign id_8 = id_0 ? 1 | id_0 : id_1;
endmodule
