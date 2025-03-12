// Seed: 1638568450
module module_0 (
    input  tri   id_0,
    output uwire id_1,
    input  uwire id_2,
    input  wor   id_3,
    output tri   id_4,
    input  wand  id_5
);
  assign id_4 = id_2 ? 1'b0 : id_3;
  assign id_1 = 1;
  wire id_7;
  logic id_8;
  logic [-1 'd0 : -1] id_9;
  ;
  reg id_10, id_11;
  final begin : LABEL_0
    id_11 <= id_7;
  end
  assign id_11 = -1;
  wire id_12;
  assign id_10 = -1;
  wire id_13;
endmodule
module module_1 #(
    parameter id_12 = 32'd39
) (
    input supply1 id_0,
    output uwire id_1,
    output supply0 id_2,
    output supply0 id_3,
    output wand id_4,
    output uwire id_5,
    output wand id_6,
    output tri id_7,
    input tri id_8,
    input supply1 id_9,
    output wire id_10,
    input tri0 id_11,
    input supply0 _id_12,
    input tri0 id_13,
    output wor id_14,
    input tri0 id_15
);
  assign id_6 = -1;
  xor primCall (id_4, id_0, id_11, id_9, id_13, id_8, id_15);
  module_0 modCall_1 (
      id_8,
      id_6,
      id_11,
      id_11,
      id_4,
      id_0
  );
  assign modCall_1.id_11 = 0;
  assign id_4 = id_0;
  wire [-1  &  id_12 : 1 'b0] id_17;
endmodule
