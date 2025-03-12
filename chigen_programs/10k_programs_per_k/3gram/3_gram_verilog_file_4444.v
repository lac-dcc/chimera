// Seed: 3441411187
module module_0 (
    output uwire id_0,
    input wand id_1,
    input wire id_2,
    input supply0 id_3,
    output supply1 id_4,
    input tri id_5,
    input tri id_6,
    input wire id_7
);
  id_9 :
  assert property (@(-1'd0) id_3)
  else if (-1'b0) begin : LABEL_0
    id_9 <= 1'b0;
  end
  assign id_9 = id_6;
  wire id_10;
  assign id_9 = -1;
endmodule
module module_1 #(
    parameter id_14 = 32'd90
) (
    output tri1 id_0,
    output tri1 id_1
    , _id_14,
    output wand id_2,
    output wor id_3,
    output wor id_4,
    input uwire id_5,
    output tri0 id_6,
    input supply0 id_7,
    output tri1 id_8,
    output supply1 id_9,
    input uwire id_10,
    input uwire id_11,
    output uwire id_12
);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_5,
      id_2,
      id_7,
      id_7,
      id_10
  );
  assign modCall_1.id_4 = 0;
  assign id_1 = id_5;
  assign id_4 = -1;
  wire [-1 : 1  !=  id_14] id_15;
  generate
    localparam id_16 = -1;
  endgenerate
endmodule
