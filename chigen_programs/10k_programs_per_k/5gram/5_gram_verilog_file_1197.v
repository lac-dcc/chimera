// Seed: 3251804024
module module_0 (
    output supply0 id_0,
    output supply1 id_1,
    output tri id_2,
    input supply1 id_3,
    input wand id_4,
    output supply1 id_5,
    input supply0 id_6,
    input wor id_7,
    input wor id_8,
    input tri1 id_9,
    output tri id_10,
    input wand id_11,
    input supply1 id_12,
    input wand id_13
);
  wire id_15 = id_6;
endmodule
module module_1 #(
    parameter id_0 = 32'd11,
    parameter id_2 = 32'd10
) (
    output wor _id_0,
    input wand id_1,
    input supply0 _id_2,
    input wand id_3,
    output wor id_4
);
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_1,
      id_3,
      id_4,
      id_3,
      id_1,
      id_3,
      id_3,
      id_4,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_3 = 0;
  logic [-1  ==  {  id_0  ,  -1 'b0 } : id_2] \id_6 ;
  ;
endmodule
