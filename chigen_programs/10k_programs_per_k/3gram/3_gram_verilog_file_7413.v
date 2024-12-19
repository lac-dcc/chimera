// Seed: 2423602944
module module_0 (
    output uwire id_0,
    input  wand  id_1,
    input  uwire id_2,
    output wand  id_3,
    output tri1  id_4
);
  always_ff @(posedge {id_1 | 1{1}}) id_4 = 1;
  assign id_4 = 1;
endmodule
module module_1 #(
    parameter id_12 = 32'd93,
    parameter id_13 = 32'd86
) (
    input  tri0  id_0,
    input  wor   id_1,
    input  uwire id_2,
    input  uwire id_3,
    output wor   id_4,
    output wire  id_5,
    input  uwire id_6,
    input  uwire id_7
);
  wire id_9;
  tri1 id_10 = 1;
  wire id_11;
  defparam id_12.id_13 = 1;
  genvar id_14;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_0,
      id_4,
      id_4
  );
  assign modCall_1.type_6 = 0;
endmodule
