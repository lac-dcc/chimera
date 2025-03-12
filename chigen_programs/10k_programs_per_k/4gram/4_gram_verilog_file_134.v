// Seed: 3336588268
module module_0 (
    output wor id_0,
    input uwire id_1,
    output tri1 id_2,
    output tri0 id_3,
    input wor id_4,
    input uwire id_5,
    input uwire id_6,
    output wire id_7,
    input wor id_8,
    input supply0 id_9,
    input wand id_10
);
  assign id_3 = (id_4);
  wire id_12;
  assign id_12 = -1'b0 ? id_8 : id_9;
endmodule
module module_1 #(
    parameter id_1 = 32'd39,
    parameter id_5 = 32'd18
) (
    input tri1 id_0,
    output supply1 _id_1,
    input tri0 id_2,
    output wire id_3,
    input wor id_4,
    output supply1 _id_5,
    input supply0 id_6
);
  logic [id_5 : id_1] id_8;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_3,
      id_0,
      id_4,
      id_6,
      id_3,
      id_4,
      id_2,
      id_6
  );
  assign modCall_1.id_9 = 0;
endmodule
