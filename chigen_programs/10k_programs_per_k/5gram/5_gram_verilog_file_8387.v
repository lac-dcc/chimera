// Seed: 2780799265
module module_0 #(
    parameter id_9 = 32'd35
) (
    output wire id_0,
    input wire id_1,
    input tri1 id_2,
    input supply1 id_3,
    input tri1 id_4,
    output tri id_5,
    output wand id_6,
    output supply1 id_7
);
  logic _id_9;
  ;
  wire id_10;
  wire [-1  !=?  id_9  <  -1 : -1  !=?  id_9] id_11;
endmodule
module module_1 #(
    parameter id_1 = 32'd21,
    parameter id_4 = 32'd62
) (
    output supply1 id_0,
    input supply0 _id_1,
    input wand id_2,
    output supply1 id_3,
    input supply0 _id_4,
    input wor id_5,
    input wire id_6
);
  wire id_8;
  ;
  wire id_9;
  logic [id_1 : id_4] id_10;
  xor primCall (id_3, id_5, id_10, id_9);
  module_0 modCall_1 (
      id_0,
      id_6,
      id_6,
      id_6,
      id_5,
      id_3,
      id_0,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
