// Seed: 4151718543
module module_0 (
    output wor id_0,
    input tri1 id_1,
    output tri1 id_2,
    output wire id_3
    , id_14 = -1'b0,
    output wand id_4,
    input wire id_5,
    input supply1 id_6,
    output tri0 id_7,
    input wor id_8,
    input tri id_9,
    output wand id_10,
    output supply0 id_11,
    input wor id_12
);
  logic id_15;
endmodule
module module_1 #(
    parameter id_0  = 32'd84,
    parameter id_11 = 32'd3,
    parameter id_6  = 32'd60
) (
    input wor _id_0,
    output uwire id_1,
    output wire id_2[id_6 : id_0],
    input supply1 id_3,
    input uwire id_4,
    input supply0 id_5,
    input wire _id_6,
    input uwire id_7
    , id_15,
    input uwire id_8,
    output wor id_9,
    input tri id_10,
    input wand _id_11,
    output tri1 id_12,
    output tri0 id_13
);
  generate
    begin : LABEL_0
      wire id_16;
    end
  endgenerate
  logic id_17[id_11 : -1];
  module_0 modCall_1 (
      id_13,
      id_4,
      id_2,
      id_2,
      id_13,
      id_8,
      id_7,
      id_12,
      id_5,
      id_8,
      id_13,
      id_1,
      id_5
  );
  assign modCall_1.id_9 = 0;
  wire id_18;
endmodule
