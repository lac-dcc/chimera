// Seed: 1032195665
module module_0 (
    input wire id_0,
    output supply0 id_1,
    output wand id_2,
    output tri1 id_3
    , id_13,
    output wand id_4,
    output supply1 id_5,
    input wire id_6,
    input uwire id_7,
    input wand id_8
    , id_14,
    output tri0 id_9,
    output tri id_10,
    output tri0 id_11
);
  localparam id_15 = 1;
  assign id_13 = (id_14);
endmodule
module module_1 #(
    parameter id_5 = 32'd49
) (
    output wand id_0,
    input tri0 id_1,
    input tri1 id_2,
    output wand id_3,
    output supply0 id_4,
    output uwire _id_5,
    input wire id_6
    , id_15,
    output wand id_7
    , id_16,
    input wor id_8,
    output wire id_9,
    input wor id_10,
    input wor id_11,
    input tri0 id_12,
    output tri id_13
);
  assign id_9 = -1;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_3,
      id_3,
      id_9,
      id_3,
      id_12,
      id_8,
      id_1,
      id_4,
      id_9,
      id_7
  );
  assign modCall_1.id_11 = 0;
  logic id_17;
  ;
  logic [id_5 : -1] id_18;
  localparam id_19 = 1;
  always begin : LABEL_0
    id_15 <= -1'b0;
  end
  nand primCall (id_7, id_10, id_16, id_12, id_6, id_2, id_15, id_11, id_1, id_8);
endmodule
