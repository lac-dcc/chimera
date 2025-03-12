// Seed: 2289587073
module module_0 (
    output tri1 id_0,
    output uwire id_1,
    output wire id_2,
    input wire id_3,
    input supply1 id_4,
    input wire id_5,
    input supply1 id_6,
    input tri0 id_7,
    output wor id_8,
    output wand id_9,
    input supply0 id_10,
    input supply0 id_11,
    input uwire id_12
);
  wire id_14;
  ;
endmodule
module module_1 #(
    parameter id_0 = 32'd75
) (
    input uwire _id_0,
    input wand id_1,
    input tri1 id_2,
    output tri1 id_3,
    output wor id_4,
    output wor id_5,
    input supply0 id_6,
    output tri1 id_7
);
  assign id_7 = 1;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_7,
      id_1,
      id_6,
      id_1,
      id_2,
      id_2,
      id_3,
      id_5,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_9 = 0;
  wire [1 : 1 'd0 ==?  1] id_9;
  wire [id_0 : 1] id_10;
endmodule
