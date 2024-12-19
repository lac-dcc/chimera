// Seed: 2877473362
module module_0 (
    input supply0 id_0,
    input wor id_1,
    output wor id_2,
    input uwire id_3,
    output wand id_4,
    input tri id_5,
    input wand id_6,
    input wand id_7,
    output wor id_8,
    output supply0 id_9,
    input supply0 id_10,
    input supply1 id_11,
    input supply0 id_12,
    output wor id_13,
    output wor id_14,
    input uwire id_15,
    output wor id_16,
    output tri1 id_17,
    input tri1 id_18
);
  assign id_17 = 1'd0;
  tri id_20 = 1;
endmodule
module module_1 #(
    parameter id_7 = 32'd56,
    parameter id_8 = 32'd11
) (
    output supply1 id_0,
    output wire id_1,
    input wire id_2,
    output wor id_3,
    output tri0 id_4,
    input wand id_5
);
  assign id_4 = 1'h0 ^ (1);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_0,
      id_5,
      id_0,
      id_2,
      id_5,
      id_5,
      id_3,
      id_1,
      id_5,
      id_2,
      id_2,
      id_3,
      id_3,
      id_2,
      id_0,
      id_4,
      id_2
  );
  assign modCall_1.id_15 = 0;
  defparam id_7.id_8 = 1;
endmodule
