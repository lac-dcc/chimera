// Seed: 1016205711
module module_0 (
    input supply0 id_0,
    input wand id_1,
    output uwire id_2,
    output wor id_3,
    output tri1 id_4,
    input uwire id_5,
    output tri1 id_6,
    input tri id_7,
    output wand id_8,
    input wand id_9
);
  assign id_3 = id_7;
endmodule
module module_1 #(
    parameter id_3 = 32'd44
) (
    input wand id_0,
    output tri1 id_1,
    output tri id_2,
    output wand _id_3,
    input supply0 id_4,
    input uwire id_5
);
  logic [1 : id_3] id_7;
  ;
  assign id_1 = id_7 >> 1;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_2,
      id_1,
      id_2,
      id_4,
      id_1,
      id_5,
      id_2,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule
