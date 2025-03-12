// Seed: 1974892692
module module_0 (
    input  supply1 id_0,
    input  uwire   id_1,
    output supply1 id_2
);
  assign id_2 = -1;
endmodule
module module_1 (
    input  tri1  id_0,
    output uwire id_1,
    input  wor   id_2,
    output tri0  id_3,
    input  uwire id_4,
    input  uwire id_5,
    input  wire  id_6,
    output uwire id_7
);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_3
  );
  assign modCall_1.id_0 = 0;
  assign id_3 = id_5;
endmodule
module module_2 #(
    parameter id_10 = 32'd66
) (
    input  tri1 id_0,
    output wand id_1,
    output tri0 id_2,
    input  wand id_3,
    input  wand id_4,
    input  tri1 id_5,
    output tri1 id_6
);
  logic id_8;
  wire  id_9;
  parameter id_10 = -1'h0;
  wire id_11;
  defparam id_10.id_10 = id_10;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
