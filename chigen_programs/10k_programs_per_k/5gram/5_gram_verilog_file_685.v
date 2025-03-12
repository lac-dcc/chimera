// Seed: 224020377
module module_0 (
    input tri1 id_0,
    output wor id_1,
    input wor id_2,
    output tri id_3,
    output supply0 id_4,
    input tri0 id_5,
    output tri1 id_6,
    output uwire id_7,
    input wand id_8,
    input supply1 id_9,
    output tri id_10
);
  logic id_12 = id_12;
endmodule
module module_1 #(
    parameter id_4 = 32'd91
) (
    output supply0 id_0,
    input tri1 id_1,
    output wand id_2,
    output supply1 id_3,
    output wor _id_4,
    input tri id_5,
    input supply1 id_6,
    input tri0 id_7,
    input wor id_8,
    input tri id_9
);
  wire id_11;
  logic [-1 : (  id_4  )] id_12;
  generate
    assign id_2 = 1;
  endgenerate
  wire id_13;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_8,
      id_0,
      id_0,
      id_5,
      id_3,
      id_2,
      id_1,
      id_8,
      id_0
  );
  assign modCall_1.id_6 = 0;
endmodule
