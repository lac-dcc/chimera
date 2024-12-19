// Seed: 67480206
module module_0 #(
    parameter id_7 = 32'd26,
    parameter id_8 = 32'd93
) (
    input  wor   id_0,
    input  uwire id_1,
    input  wor   id_2,
    output uwire id_3,
    input  tri0  id_4,
    output tri1  id_5
);
  defparam id_7.id_8 = 1;
  wor id_9 = 1;
endmodule
module module_1 (
    output tri0  id_0,
    output uwire id_1,
    input  wire  id_2,
    input  tri   id_3,
    output tri   id_4,
    input  tri0  id_5,
    input  wand  id_6,
    output tri0  id_7,
    output tri0  id_8,
    output wire  id_9,
    output logic id_10,
    input  uwire id_11,
    input  tri0  id_12,
    input  tri1  id_13
);
  always_comb #1 if (id_5) id_10 <= 1'd0;
  module_0 modCall_1 (
      id_3,
      id_12,
      id_6,
      id_9,
      id_5,
      id_9
  );
  assign modCall_1.type_0 = 0;
endmodule
