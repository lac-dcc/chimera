// Seed: 2565101572
module module_0 (
    input  tri0  id_0,
    output tri1  id_1,
    input  tri0  id_2,
    input  tri   module_0,
    input  tri   id_4,
    input  uwire id_5,
    input  uwire id_6,
    output wire  id_7
);
  tri0 id_9 = id_6 & 1'b0;
endmodule
module module_1 #(
    parameter id_10 = 32'd67,
    parameter id_9  = 32'd93
) (
    input supply0 id_0,
    input wand id_1,
    input wor id_2,
    input wire id_3,
    input wand id_4,
    output wire id_5,
    input tri0 id_6
);
  wire id_8;
  generate
    defparam id_9.id_10 = 1'h0;
  endgenerate
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_1,
      id_4,
      id_0,
      id_6,
      id_5
  );
  assign modCall_1.type_4 = 0;
endmodule
