// Seed: 4097450832
module module_0 (
    output tri1 id_0,
    input wire id_1,
    input wor id_2,
    input supply1 id_3,
    input uwire id_4,
    output wor id_5,
    output uwire id_6,
    input uwire id_7,
    output supply0 id_8,
    input tri id_9,
    input tri0 id_10,
    output wand id_11
);
  assign id_5 = id_10;
  id_13 :
  assert property (@(posedge id_3) 1)
  else $unsigned(65);
  ;
endmodule
module module_1 #(
    parameter id_0 = 32'd90
) (
    input  uwire _id_0,
    output tri   id_1,
    input  tri   id_2
);
  logic [-1 : id_0] id_4;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1
  );
  assign modCall_1.id_1 = 0;
  generate
    assign id_1 = id_0 ? 1 : (id_0);
    assign id_4 = id_4;
  endgenerate
endmodule
