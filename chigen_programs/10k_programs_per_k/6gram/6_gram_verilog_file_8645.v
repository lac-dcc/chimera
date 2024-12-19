// Seed: 304772614
module module_0 #(
    parameter id_11 = 32'd41,
    parameter id_12 = 32'd70
) (
    input supply1 id_0,
    output supply0 id_1,
    input supply1 id_2,
    input uwire id_3
    , id_10,
    output supply0 id_4,
    input supply0 id_5,
    input tri0 id_6,
    input wand id_7,
    output wire id_8
);
  defparam id_11.id_12 = 1 - 1;
endmodule
module module_1 #(
    parameter id_10 = 32'd32,
    parameter id_9  = 32'd82
) (
    output wand id_0,
    input tri1 id_1,
    input wor id_2,
    input wire id_3,
    input supply0 id_4,
    input wand id_5,
    output wand id_6
);
  wor id_8 = id_5#(.id_1(1));
  defparam id_9.id_10 = {1{1'h0}};
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_1,
      id_0,
      id_5,
      id_1,
      id_1,
      id_8
  );
  assign modCall_1.id_6 = 0;
endmodule
