// Seed: 983537336
module module_0 #(
    parameter id_7 = 32'd10,
    parameter id_8 = 32'd34
) (
    input  tri0  id_0,
    input  tri   id_1,
    output tri0  id_2,
    input  uwire id_3,
    input  wand  id_4,
    output wand  id_5
);
  defparam id_7.id_8 = id_7;
endmodule
module module_1 (
    input  uwire id_0,
    input  wire  id_1,
    input  uwire id_2,
    output tri1  id_3,
    input  wire  id_4,
    input  tri0  id_5,
    output tri0  id_6
);
  logic [7:0] id_8;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_6,
      id_0,
      id_0,
      id_6
  );
  assign modCall_1.id_4 = 0;
  assign id_3 = 1'h0;
  wire id_9, id_10;
  assign id_8[1] = 1;
endmodule
