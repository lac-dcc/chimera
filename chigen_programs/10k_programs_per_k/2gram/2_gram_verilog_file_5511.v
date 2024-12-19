// Seed: 2010057533
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input wand id_2,
    output tri0 id_3,
    input uwire id_4,
    output wand id_5,
    input wand id_6,
    input tri id_7,
    input supply0 id_8,
    input tri1 id_9,
    input wire id_10,
    output wor id_11,
    input wire id_12,
    output tri0 id_13,
    output wire id_14,
    output tri0 id_15,
    input tri1 id_16
    , id_21,
    output wor id_17
    , id_22,
    output tri0 id_18,
    output wire id_19
);
  assign id_5 = id_7;
  assign id_3 = id_0;
endmodule
module module_1 (
    input  tri1 id_0,
    output wor  id_1,
    output tri  id_2
);
  supply0 id_4;
  wire id_5;
  assign id_4 = id_0;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_0,
      id_0,
      id_4,
      id_0,
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_1,
      id_4,
      id_4,
      id_2,
      id_1
  );
  assign modCall_1.id_15 = 0;
endmodule
