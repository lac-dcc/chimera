// Seed: 2566052135
module module_0 (
    input  tri0 id_0,
    input  tri1 id_1,
    input  wor  id_2,
    input  tri  id_3,
    input  wand id_4,
    input  tri  id_5
    , id_10,
    input  tri0 id_6,
    input  tri  id_7,
    output tri  id_8
);
  wire id_11;
endmodule
module module_1 #(
    parameter id_17 = 32'd26,
    parameter id_18 = 32'd66
) (
    input wor id_0,
    output tri0 id_1,
    output wand id_2,
    input wor id_3,
    output wire id_4,
    input tri0 id_5,
    input wor id_6,
    output supply0 id_7,
    input wor id_8,
    output wor id_9,
    input supply0 id_10,
    input tri1 id_11,
    input supply1 id_12,
    output tri0 id_13
);
  id_15(
      .id_0(id_0 ^ id_11), .id_1(id_5), .id_2(id_10), .id_3(id_1 == id_10)
  );
  genvar id_16;
  defparam id_17.id_18 = 1;
  module_0 modCall_1 (
      id_3,
      id_11,
      id_6,
      id_3,
      id_8,
      id_3,
      id_6,
      id_10,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
