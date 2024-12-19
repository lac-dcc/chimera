// Seed: 1263634494
module module_0 (
    input wor id_0,
    input tri1 id_1,
    input tri id_2,
    input tri id_3,
    input supply1 id_4,
    output supply0 id_5,
    output supply1 id_6,
    output wand id_7,
    output wand id_8
);
  supply1 id_10 = 1;
  wire id_11;
endmodule
module module_1 #(
    parameter id_13 = 32'd39
) (
    input tri id_0,
    input tri id_1,
    input uwire id_2,
    input tri1 id_3,
    input supply1 id_4,
    input tri0 id_5,
    output wire id_6,
    input tri0 id_7,
    input tri1 id_8,
    input wire id_9
    , id_12,
    output wand id_10
);
  defparam id_13 = 1'd0; id_14(
      1
  );
  assign id_6 = 1;
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_4,
      id_4,
      id_9,
      id_6,
      id_6,
      id_6,
      id_10
  );
  assign modCall_1.id_1 = 0;
  tri id_16 = 1 & 1;
endmodule
