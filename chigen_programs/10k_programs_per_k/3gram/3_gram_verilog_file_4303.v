// Seed: 1123482236
module module_0 (
    output tri1 id_0,
    output uwire id_1,
    input wand id_2,
    input tri1 id_3,
    input tri0 id_4,
    input supply1 id_5,
    output wor id_6,
    input tri id_7,
    input supply1 id_8,
    output wire id_9,
    input wand id_10,
    input tri0 id_11,
    input tri0 id_12,
    output tri id_13,
    input supply1 id_14
);
  wire id_16 = id_7;
endmodule
module module_1 #(
    parameter id_0 = 32'd27
) (
    input supply1 _id_0,
    input wand id_1,
    input supply1 id_2,
    input supply0 id_3,
    output wor id_4
);
  logic id_6 [1 : id_0];
  wire  id_7;
  ;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_3,
      id_2,
      id_1,
      id_3,
      id_4,
      id_1,
      id_3,
      id_4,
      id_2,
      id_2,
      id_2,
      id_4,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
