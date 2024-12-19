// Seed: 2202548207
module module_0 (
    input  wand  id_0,
    input  tri0  id_1,
    input  wire  id_2,
    input  wand  id_3,
    input  tri   id_4,
    output wand  id_5,
    input  wand  id_6,
    output wire  id_7,
    output wor   id_8,
    input  wand  id_9,
    output tri   id_10,
    input  uwire id_11,
    input  wor   id_12,
    input  wand  id_13,
    input  uwire id_14
    , id_19,
    input  wire  id_15,
    output uwire id_16,
    output wor   id_17
);
  always @(1) begin : LABEL_0
    if (id_0 != 1'd0) begin : LABEL_0
      disable id_20;
      id_19 = id_11;
    end
  end
endmodule
module module_1 (
    input tri0 id_0,
    input uwire id_1,
    output wor id_2,
    output supply1 id_3,
    input tri1 id_4,
    output tri id_5,
    input wire id_6,
    output supply1 id_7,
    input wand id_8,
    input tri1 id_9,
    input tri id_10
    , id_20,
    output uwire id_11
    , id_21,
    output supply0 id_12,
    input wire id_13
    , id_22,
    output wor id_14,
    input supply1 id_15,
    input tri1 id_16,
    output tri id_17,
    output supply0 id_18
);
  wire id_23;
  module_0 modCall_1 (
      id_0,
      id_10,
      id_13,
      id_10,
      id_4,
      id_12,
      id_13,
      id_2,
      id_2,
      id_9,
      id_14,
      id_8,
      id_13,
      id_16,
      id_6,
      id_0,
      id_17,
      id_18
  );
  assign modCall_1.id_11 = 0;
endmodule
