// Seed: 3487410451
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    input tri1 id_2,
    output tri0 id_3,
    output supply0 id_4,
    output tri id_5,
    output wand id_6,
    output tri1 id_7,
    input supply0 id_8,
    output tri id_9,
    input wand id_10,
    output uwire id_11,
    output tri id_12,
    input wor id_13,
    input supply1 id_14,
    input supply1 id_15,
    input wire id_16,
    input wor id_17,
    input wor id_18,
    input supply1 id_19
);
  assign id_5  = id_15;
  assign id_12 = -1;
endmodule
module module_1 #(
    parameter id_3 = 32'd36,
    parameter id_5 = 32'd58
) (
    output supply0 id_0,
    output wire id_1,
    output supply0 id_2,
    input supply0 _id_3,
    input tri id_4,
    input supply1 _id_5,
    output wand id_6
);
  assign id_2 = id_4;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_6,
      id_0,
      id_1,
      id_0,
      id_6,
      id_4,
      id_6,
      id_4,
      id_1,
      id_6,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_9 = 0;
  parameter [id_3 : ~  id_5] id_8 = 1;
endmodule
