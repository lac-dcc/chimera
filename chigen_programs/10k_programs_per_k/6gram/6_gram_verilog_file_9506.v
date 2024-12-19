// Seed: 1452588672
module module_0 (
    output tri1 id_0,
    output wire id_1
    , id_25,
    input uwire id_2,
    input tri1 id_3,
    input supply0 id_4,
    input wire id_5,
    output wor id_6,
    output tri0 id_7,
    output uwire id_8,
    input tri id_9,
    output supply1 id_10,
    input supply1 id_11,
    output wand id_12,
    output uwire id_13,
    input uwire id_14,
    output wire id_15,
    input wand id_16,
    input tri0 id_17,
    output wand id_18
    , id_26,
    input supply0 id_19,
    input uwire id_20,
    input wire id_21,
    input wire id_22,
    output supply0 id_23
);
  always @(posedge 1) begin : LABEL_0
    id_1 = (id_9);
  end
endmodule
module module_1 (
    input  tri   id_0,
    output wand  id_1,
    input  tri0  id_2,
    output wire  id_3,
    input  uwire id_4,
    input  wor   id_5,
    input  uwire id_6
);
  assign id_1 = id_5;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_2,
      id_5,
      id_0,
      id_1,
      id_1,
      id_1,
      id_5,
      id_3,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_5,
      id_3,
      id_6,
      id_5,
      id_5,
      id_2,
      id_3
  );
  assign modCall_1.type_9 = 0;
endmodule
