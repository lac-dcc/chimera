// Seed: 1988617763
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    output supply0 id_2,
    output wire id_3,
    output wand id_4
    , id_10,
    input supply0 id_5,
    output supply1 id_6,
    input tri0 id_7,
    input wor id_8
);
  always_latch @(1, posedge id_7) id_10 = 1;
endmodule
module module_1 #(
    parameter id_6 = 32'd88,
    parameter id_7 = 32'd3
) (
    input  tri0  id_0,
    output wire  id_1,
    output uwire id_2,
    output wire  id_3,
    input  tri0  id_4
);
  defparam id_6.id_7 = 1;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_3,
      id_2,
      id_3,
      id_0,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_8 = 0;
endmodule
