// Seed: 425061625
module module_0 #(
    parameter id_15 = 32'd48,
    parameter id_16 = 32'd90
) (
    input tri1 id_0,
    input supply1 id_1,
    input uwire id_2
    , id_13,
    output tri0 id_3,
    input tri1 id_4,
    input tri id_5,
    output tri id_6,
    input wor id_7,
    input uwire id_8,
    output tri1 id_9,
    input tri id_10,
    output wor id_11
);
  wire id_14;
  defparam id_15.id_16 = 1;
  wire id_17;
endmodule
module module_1 (
    inout  tri0  id_0,
    input  tri   id_1,
    output uwire id_2,
    output wand  id_3,
    input  wire  id_4,
    input  uwire id_5,
    output tri1  id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_0,
      id_0,
      id_4,
      id_6,
      id_5,
      id_0,
      id_3,
      id_0,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
