// Seed: 1512762523
module module_0 (
    input supply0 id_0,
    input wire id_1,
    output wor id_2,
    output supply1 id_3,
    output supply1 id_4,
    input tri id_5,
    input wand id_6,
    input supply0 id_7
);
  wire id_9;
  assign id_4 = 1;
endmodule
module module_1 #(
    parameter id_7 = 32'd36,
    parameter id_9 = 32'd32
) (
    input uwire id_0,
    input uwire id_1,
    output uwire id_2,
    input tri id_3,
    output wor id_4,
    input supply1 id_5,
    output wor id_6,
    output tri _id_7,
    output tri id_8,
    output supply0 _id_9,
    input uwire id_10,
    input wand id_11,
    output supply0 id_12,
    input supply0 id_13[id_7 : (  id_9  ?  -1 : 1 'd0 )],
    input supply1 id_14,
    input supply0 id_15,
    output tri id_16
);
  assign id_4 = id_11;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_2,
      id_2,
      id_8,
      id_15,
      id_5,
      id_3
  );
  assign modCall_1.id_6 = 0;
endmodule
