// Seed: 2872746239
module module_0 (
    output wand id_0,
    input tri id_1,
    input supply1 id_2,
    output supply1 id_3,
    output supply1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    input wire id_7,
    input wire id_8
);
endmodule
module module_1 #(
    parameter id_8 = 32'd47
) (
    input tri0 id_0,
    input wand id_1,
    output supply1 id_2,
    output supply1 id_3,
    input supply1 id_4,
    output wand id_5,
    output tri1 id_6,
    input wire id_7,
    output tri1 _id_8,
    output tri0 id_9,
    output supply0 id_10,
    input tri1 id_11,
    input tri0 id_12,
    output tri id_13
);
  assign id_9 = id_12;
  assign id_2 = id_7 ^ id_11;
  logic [1 : id_8] id_15;
  module_0 modCall_1 (
      id_2,
      id_12,
      id_12,
      id_9,
      id_9,
      id_7,
      id_11,
      id_4,
      id_11
  );
  assign modCall_1.type_14 = 0;
  wire id_16;
  assign id_16 = "" == id_15;
endmodule
