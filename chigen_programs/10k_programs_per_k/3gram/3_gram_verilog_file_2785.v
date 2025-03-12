// Seed: 974195816
module module_0 (
    output wire id_0,
    input supply1 id_1,
    output wire id_2,
    input supply1 id_3,
    output tri0 id_4,
    input supply1 id_5,
    input tri1 id_6,
    input tri1 id_7,
    input wor id_8,
    input tri1 id_9,
    input uwire id_10,
    output wire id_11,
    input wand id_12
);
  assign id_0 = -1;
endmodule
module module_1 #(
    parameter id_3 = 32'd87
) (
    input  tri0 id_0,
    input  tri1 id_1,
    output wand id_2,
    output wire _id_3,
    output wor  id_4
);
  logic [id_3 : id_3] id_6;
  or primCall (id_2, id_0, id_7, id_6);
  wire id_7;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_4,
      id_1
  );
  assign modCall_1.id_11 = 0;
endmodule
