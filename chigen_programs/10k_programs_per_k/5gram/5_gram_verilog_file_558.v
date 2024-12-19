// Seed: 596691885
module module_0 #(
    parameter id_7 = 32'd44,
    parameter id_8 = 32'd90
) (
    input  tri0 id_0,
    output wand id_1,
    output tri0 id_2,
    output tri0 id_3
);
  wire id_5;
  wire id_6;
  assign id_1 = 1;
  defparam id_7.id_8 = id_8;
endmodule
module module_1 #(
    parameter id_3 = 32'd84,
    parameter id_4 = 32'd3
) (
    output uwire id_0,
    input  tri0  id_1
);
  assign id_0 = id_1 ? id_1 : 1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_8 = 0;
  assign id_0 = id_1;
  defparam id_3.id_4 = -id_1;
endmodule
