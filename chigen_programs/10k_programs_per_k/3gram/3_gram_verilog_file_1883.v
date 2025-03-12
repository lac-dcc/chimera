// Seed: 1018549947
module module_0 (
    input wor id_0,
    input tri1 id_1,
    input supply0 id_2,
    input supply0 id_3,
    output supply1 id_4,
    input wire id_5,
    input supply1 id_6,
    input supply0 id_7,
    input wand id_8,
    output wand id_9
);
  assign id_4 = id_2;
endmodule
module module_1 #(
    parameter id_3 = 32'd93
) (
    input wor id_0,
    input tri1 id_1,
    output tri id_2,
    input supply1 _id_3,
    output supply0 id_4,
    output supply1 id_5,
    output wand id_6,
    output supply1 id_7,
    output tri id_8,
    output wand id_9
);
  wire id_11;
  or primCall (id_6, id_0, id_12, id_1);
  wire [id_3 : 1] id_12;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_1,
      id_7,
      id_1,
      id_0,
      id_0,
      id_0,
      id_6
  );
  assign modCall_1.id_2 = 0;
endmodule
