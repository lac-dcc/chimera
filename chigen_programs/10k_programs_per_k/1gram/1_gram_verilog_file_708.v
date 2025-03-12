// Seed: 1964311
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    output wire id_2,
    output tri0 id_3,
    input supply0 id_4,
    input wand id_5,
    input supply0 id_6,
    output supply1 id_7,
    output tri1 id_8,
    input uwire id_9,
    output supply0 id_10,
    input uwire id_11
    , id_17,
    output wand id_12,
    output supply1 id_13,
    input tri1 id_14,
    input wand id_15
);
  logic id_18 = id_1;
  parameter id_19 = 1;
endmodule
module module_1 #(
    parameter id_0 = 32'd99
) (
    output tri0 _id_0,
    output tri  id_1 [id_0 : -1],
    input  tri  id_2
);
  assign id_1 = -1 ? 1 : id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
