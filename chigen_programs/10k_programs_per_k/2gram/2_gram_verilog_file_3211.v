// Seed: 2293340560
module module_0 (
    input wor id_0,
    input wor id_1,
    input supply0 id_2,
    input wor id_3,
    output wor id_4,
    output supply0 id_5,
    input tri1 id_6,
    output supply1 id_7,
    output wire id_8,
    input tri0 id_9,
    input wand id_10,
    output wor id_11,
    input tri0 id_12,
    input tri0 id_13
);
  assign id_5  = id_12 | 1'b0 | id_0;
  assign id_11 = id_13;
endmodule
module module_1 #(
    parameter id_0 = 32'd71
) (
    input  tri   _id_0,
    output wand  id_1,
    input  wire  id_2,
    output uwire id_3,
    output wor   id_4
);
  wire [id_0 : -1] id_6;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_4,
      id_4,
      id_2,
      id_1,
      id_4,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
