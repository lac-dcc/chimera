// Seed: 2994187382
module module_0 (
    output wire id_0,
    output uwire id_1,
    input tri1 id_2,
    input tri0 id_3,
    input tri id_4,
    output uwire id_5,
    input tri0 id_6,
    output wor id_7,
    output wand id_8,
    input tri id_9,
    input supply0 id_10,
    input wire id_11,
    input tri0 id_12,
    input wor id_13,
    output wand id_14
);
  wire id_16;
endmodule
module module_1 #(
    parameter id_3 = 32'd81,
    parameter id_5 = 32'd30
) (
    input wand id_0,
    output tri0 id_1,
    input tri1 id_2,
    output wand _id_3,
    output tri0 id_4,
    input tri0 _id_5,
    input supply0 id_6,
    output wand id_7
);
  logic [id_5 : id_3] id_9;
  or primCall (id_1, id_2, id_9, id_0, id_6);
  module_0 modCall_1 (
      id_4,
      id_7,
      id_6,
      id_2,
      id_2,
      id_4,
      id_6,
      id_1,
      id_7,
      id_6,
      id_0,
      id_2,
      id_6,
      id_0,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
