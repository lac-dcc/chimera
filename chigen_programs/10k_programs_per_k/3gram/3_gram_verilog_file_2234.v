// Seed: 179797216
module module_0 #(
    parameter id_7 = 32'd98
) (
    output tri1 id_0,
    input  wand id_1,
    output wand id_2,
    input  tri1 id_3,
    output tri  id_4
    , _id_7,
    input  wire id_5
);
  logic id_8 = 1;
  logic [-1 : 1 'h0] id_9;
  ;
  uwire id_10 = 1;
  wire [-1 : id_7] id_11;
endmodule
module module_1 #(
    parameter id_2 = 32'd14
) (
    input  tri1  id_0,
    input  tri0  id_1,
    input  tri1  _id_2,
    output uwire id_3
);
  wire  id_5;
  logic id_6;
  ;
  assign id_6[id_2] = -1'h0 == (-1'b0);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_0,
      id_3,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
