// Seed: 3708597134
module module_0 (
    output wor id_0,
    input wor id_1,
    output supply1 id_2,
    input supply0 id_3,
    output tri id_4,
    input tri0 id_5,
    input tri0 id_6,
    input tri0 id_7,
    output tri1 id_8,
    output uwire id_9,
    output wor id_10,
    input wor id_11
);
  assign id_8 = id_6;
endmodule
module module_1 #(
    parameter id_1 = 32'd74,
    parameter id_4 = 32'd21,
    parameter id_5 = 32'd58
) (
    input wand id_0[id_4 : 1 'b0 ^  {  {  1  {  id_5  }  }  }],
    input uwire _id_1,
    input tri id_2,
    output tri1 id_3,
    input wand _id_4,
    input supply1 _id_5
);
  parameter id_7[-1  &  id_1 : 1] = 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
