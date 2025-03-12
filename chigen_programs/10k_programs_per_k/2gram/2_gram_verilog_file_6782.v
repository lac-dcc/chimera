// Seed: 983416859
module module_0 (
    input supply1 id_0,
    input wor id_1,
    output wor id_2,
    input tri1 id_3,
    input uwire id_4,
    input wor id_5,
    input wor id_6,
    input tri1 id_7,
    input supply0 id_8,
    input tri id_9
    , id_17,
    output tri0 id_10,
    input tri0 id_11
    , id_18,
    output tri0 id_12,
    output wire id_13,
    input supply1 id_14,
    input supply1 id_15
    , id_19
);
  always begin : LABEL_0
    if (1) begin : LABEL_1
      id_17 <= id_7;
    end
  end
endmodule
module module_1 #(
    parameter id_12 = 32'd97,
    parameter id_18 = 32'd2
) (
    input  wand  id_0
    , id_9,
    input  wand  id_1,
    input  wire  id_2,
    input  wor   id_3,
    output tri0  id_4,
    input  tri0  id_5,
    input  uwire id_6,
    output tri   id_7
);
  wire id_10;
  logic [7:0] id_11, _id_12, id_13, id_14, id_15, id_16, id_17;
  _id_18(
      -1 !=? -1, id_1
  );
  wire id_19;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_4,
      id_0,
      id_1,
      id_3,
      id_0,
      id_1,
      id_1,
      id_6,
      id_4,
      id_2,
      id_4,
      id_4,
      id_1,
      id_0
  );
  assign modCall_1.id_3 = 0;
  wire [id_12 : ~  1] id_20;
  wire id_21;
  assign id_19 = id_0;
endmodule
