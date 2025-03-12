// Seed: 2951515155
module module_0 (
    output wor  id_0,
    input  tri1 id_1
);
  assign id_0 = {(id_1), id_1} ? -1'd0 : id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd69
) (
    input  wand id_0,
    input  tri1 _id_1,
    output tri1 id_2
);
  assign id_2 = id_0;
  assign id_2 = id_1;
  logic id_4;
  assign id_4 = id_1 ? -1'b0 : 1;
  module_0 modCall_1 (
      id_2,
      id_0
  );
  assign modCall_1.id_0 = 0;
  wire id_5;
  wire [1 : -1] id_6;
  logic [7:0] id_7, id_8;
  assign id_8[id_1] = -1'd0;
endmodule
