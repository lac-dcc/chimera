// Seed: 3098678190
module module_0 (
    input tri1 id_0,
    input wand id_1,
    input wor id_2,
    output tri id_3,
    input supply1 id_4,
    input tri1 id_5
);
  assign id_3 = 1;
  wire id_7;
  assign id_7 = -1;
endmodule
module module_1 #(
    parameter id_2 = 32'd97
) (
    input  tri1 id_0,
    inout  tri1 id_1,
    input  wor  _id_2,
    input  wor  id_3,
    output tri  id_4
);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_4,
      id_3,
      id_1
  );
  assign modCall_1.id_1 = 0;
  logic [-1 : id_2] id_6;
  assign id_6[1] = id_2;
  id_7 :
  assert property (@(posedge 1 or 1 - 1) id_0)
  else;
endmodule
