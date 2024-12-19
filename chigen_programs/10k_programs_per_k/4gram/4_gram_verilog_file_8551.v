// Seed: 4109709975
module module_0 (
    input tri0 id_0,
    input wand id_1,
    input uwire id_2,
    input tri1 id_3,
    input tri1 id_4,
    output wand id_5,
    input tri0 id_6,
    input wand id_7,
    input supply1 id_8,
    output wand id_9,
    input wor id_10,
    output supply0 id_11,
    input uwire id_12,
    output tri0 id_13,
    input wand id_14,
    input supply0 id_15,
    input wire id_16,
    input wand id_17
    , id_24,
    input wire id_18,
    output uwire id_19,
    input wand id_20,
    output wand id_21,
    input tri1 id_22
);
  wire id_25;
  wire id_26;
  wire id_27;
  assign id_11 = id_7;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri0  id_1,
    output wor   id_2
);
  uwire id_4 = id_1;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_1,
      id_4,
      id_2,
      id_1,
      id_4,
      id_1,
      id_4,
      id_0,
      id_0,
      id_4,
      id_0,
      id_1,
      id_4,
      id_4,
      id_4,
      id_0
  );
  assign modCall_1.type_4 = 0;
  wire id_5;
endmodule
