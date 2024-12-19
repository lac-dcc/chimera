// Seed: 2025436939
module module_0 (
    output wor id_0,
    input supply1 id_1,
    input wire id_2,
    input uwire id_3,
    input wand id_4,
    input tri1 id_5,
    output supply0 id_6,
    input tri0 id_7,
    output tri0 id_8
);
  wire id_10;
  assign module_1.id_13 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd22,
    parameter id_13 = 32'd28
) (
    input supply0 id_0,
    input supply1 id_1,
    output uwire id_2,
    input tri id_3,
    output supply0 id_4,
    output wor id_5,
    input wand id_6,
    output supply0 id_7,
    output tri1 id_8,
    output supply1 id_9
);
  logic [7:0] id_11;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_1,
      id_0,
      id_1,
      id_8,
      id_6,
      id_9
  );
  generate
    defparam id_12.id_13 = id_11[1];
  endgenerate
endmodule
