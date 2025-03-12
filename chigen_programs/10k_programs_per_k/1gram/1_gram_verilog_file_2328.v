// Seed: 43423405
module module_0 (
    output wire  id_0,
    input  tri1  id_1,
    input  uwire id_2
);
  genvar id_4;
endmodule
module module_1 #(
    parameter id_4 = 32'd30,
    parameter id_7 = 32'd78
) (
    input  uwire id_0,
    output wand  id_1,
    input  wor   id_2,
    input  uwire id_3 [-1 : id_4],
    input  tri1  _id_4,
    input  tri1  id_5
);
  logic _id_7;
  ;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_5
  );
  assign modCall_1.id_0 = 0;
  wire id_8;
  bit [1 : id_7] id_9;
  assign id_7 = id_3;
  id_10 :
  assert property (@(posedge -1'b0 or posedge -1) -1'b0) id_9 = id_0;
endmodule
