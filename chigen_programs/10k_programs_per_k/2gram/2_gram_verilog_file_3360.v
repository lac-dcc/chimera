// Seed: 3441849052
module module_0 (
    input wand id_0,
    output supply1 id_1,
    input wire id_2,
    output uwire id_3,
    output tri1 id_4,
    input tri1 id_5,
    input tri0 id_6,
    input supply1 id_7,
    input wand id_8,
    input tri0 id_9
);
  wire  id_11;
  logic id_12;
  ;
  wire id_13;
  assign id_3 = id_13;
endmodule
module module_1 #(
    parameter id_1 = 32'd79,
    parameter id_5 = 32'd10
) (
    input wire id_0,
    output wor _id_1,
    output wand id_2,
    output wand id_3,
    input tri id_4,
    input wand _id_5,
    input wand id_6,
    output supply1 id_7,
    input tri0 id_8,
    output tri0 id_9,
    input uwire id_10,
    input wire id_11,
    input wand id_12
);
  wire \id_14 = id_8;
  logic [id_5 : id_1] id_15;
  module_0 modCall_1 (
      id_11,
      id_7,
      id_8,
      id_2,
      id_9,
      id_12,
      id_10,
      id_12,
      id_10,
      id_8
  );
  assign modCall_1.id_2 = 0;
endmodule
