// Seed: 3394883493
module module_0 (
    input  tri  id_0,
    output tri  id_1,
    input  wor  id_2,
    input  tri0 id_3,
    output tri1 id_4
);
endmodule
module module_1 #(
    parameter id_6 = 32'd57,
    parameter id_8 = 32'd69
) (
    output tri id_0,
    input wor id_1,
    input tri1 id_2,
    input tri id_3,
    input wire id_4,
    output supply0 id_5,
    output tri _id_6,
    input supply1 id_7,
    input tri0 _id_8,
    input tri1 id_9,
    input wand id_10,
    output tri0 id_11
);
  logic [id_6 : -1 'b0] id_13[1 : id_8];
  ;
  nor primCall (id_5, id_9, id_7, id_2, id_3, id_13, id_4, id_10, id_1);
  module_0 modCall_1 (
      id_9,
      id_5,
      id_1,
      id_9,
      id_5
  );
  assign modCall_1.id_2 = 0;
endmodule
