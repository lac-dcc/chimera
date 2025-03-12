// Seed: 4098255455
module module_0 (
    input tri1 id_0,
    output supply0 id_1,
    output wand id_2,
    output tri0 id_3,
    input tri id_4,
    output tri1 id_5,
    input wand id_6,
    output wand id_7,
    input wor id_8
);
endmodule
module module_1 #(
    parameter id_0 = 32'd24
) (
    input wor _id_0,
    output supply1 id_1,
    input supply0 id_2,
    output uwire id_3,
    output wire id_4,
    output supply0 id_5
);
  wire [id_0 : 1] id_7;
  bufif1 primCall (id_3, id_2, id_7);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_3,
      id_4,
      id_2,
      id_4,
      id_2,
      id_5,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule
