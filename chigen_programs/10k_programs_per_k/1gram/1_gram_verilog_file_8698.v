// Seed: 3771392127
module module_0 (
    output wand id_0,
    output supply1 id_1,
    output supply1 id_2,
    input tri0 id_3,
    output tri id_4,
    output wand id_5,
    output tri id_6,
    output tri0 id_7,
    input tri id_8,
    input wire id_9,
    input wor id_10,
    input supply1 id_11,
    input wand id_12,
    input wire id_13,
    input uwire id_14,
    output tri0 id_15,
    input tri0 id_16,
    input supply1 id_17,
    output wor id_18,
    input tri1 id_19,
    input wor id_20,
    input tri id_21,
    input tri0 id_22,
    output tri id_23,
    output wire id_24
);
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    input supply1 id_2,
    input logic id_3,
    input wor id_4
);
  wor id_6;
  assign id_6 = 1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_1,
      id_4,
      id_1,
      id_1,
      id_1,
      id_4,
      id_0,
      id_4,
      id_4,
      id_0,
      id_4,
      id_4,
      id_4,
      id_4,
      id_0,
      id_0
  );
  assign modCall_1.type_33 = 0;
  tri0 id_7;
  reg  id_8;
  assign id_6 = id_8 * id_7;
  wire  id_9;
  uwire id_10 = id_4, id_11;
  wor   id_12 = 1;
  always begin : LABEL_0
    id_8 <= id_3;
    force id_10 = 1;
  end
endmodule
