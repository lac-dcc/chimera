// Seed: 2897073726
module module_0 (
    output wor id_0,
    input uwire id_1,
    input uwire id_2,
    input supply0 id_3,
    input wire id_4,
    output wire id_5,
    input wand id_6,
    output supply0 id_7,
    output supply1 id_8
);
  if (-1'b0) begin : LABEL_0
    wire id_10;
  end
  parameter id_11 = -1'b0;
endmodule
module module_1 #(
    parameter id_12 = 32'd29,
    parameter id_3  = 32'd82,
    parameter id_6  = 32'd30
) (
    output wire id_0,
    input tri id_1,
    input tri id_2,
    output supply0 _id_3,
    output supply1 id_4,
    input uwire id_5,
    input tri1 _id_6,
    output supply1 id_7,
    output tri1 id_8,
    output tri id_9,
    output wand id_10,
    input supply0 id_11,
    output wand _id_12,
    output wor id_13,
    output wire id_14
);
  logic [-1 : id_12] id_16;
  ;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_1,
      id_2,
      id_11,
      id_13,
      id_2,
      id_13,
      id_10
  );
  assign modCall_1.id_3 = 0;
  logic [id_3 : id_6] id_17 = id_2;
endmodule
