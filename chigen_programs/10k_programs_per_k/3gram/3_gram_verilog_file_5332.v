// Seed: 273565559
module module_0 (
    output supply0 id_0,
    output supply1 id_1,
    input wand id_2,
    output wire id_3,
    input tri0 id_4,
    output tri0 id_5,
    input wor id_6,
    input tri1 id_7,
    input wor id_8,
    output wand id_9,
    input tri1 id_10,
    output wand id_11
);
  assign id_3 = id_2;
  assign id_0 = id_8 ? 1'b0 : id_10;
  wire id_13, id_14;
endmodule
module module_1 #(
    parameter id_2 = 32'd75
) (
    output wire id_0,
    input supply0 id_1,
    output tri1 _id_2,
    output wand id_3,
    input supply1 id_4
);
  logic [-1 'b0 : id_2] id_6;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_0,
      id_4,
      id_3,
      id_4,
      id_1,
      id_4,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.id_7 = 0;
endmodule
