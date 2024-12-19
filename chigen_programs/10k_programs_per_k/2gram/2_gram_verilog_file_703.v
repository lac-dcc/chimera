// Seed: 350522836
module module_0 #(
    parameter id_10 = 32'd88,
    parameter id_8  = 32'd84,
    parameter id_9  = 32'd3
) (
    input  uwire id_0,
    input  wor   id_1,
    output wor   id_2,
    output uwire id_3,
    output tri   id_4,
    input  wire  id_5
);
  assign id_2 = 1;
  assign id_4 = 1'b0;
  wire id_7;
  defparam id_8.id_9.id_10 = (id_10);
  wire id_11;
  tri0 id_12 = id_5;
endmodule
module module_1 (
    input tri1 id_0
);
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0
  );
  assign modCall_1.id_9 = 0;
  wand id_3 = id_0;
endmodule
