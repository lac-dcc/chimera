// Seed: 1076616289
macromodule module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input supply1 id_2,
    input supply1 id_3,
    input tri id_4
    , id_14,
    output tri id_5,
    input wand id_6,
    output tri id_7,
    input supply0 id_8,
    input supply0 id_9,
    input supply0 id_10,
    input wand id_11,
    input wire id_12
);
  assign id_5 = id_8;
endmodule
module module_1 #(
    parameter id_6 = 32'd4,
    parameter id_9 = 32'd39
) (
    output tri0  id_0,
    input  uwire id_1,
    output wor   id_2,
    output tri0  id_3
    , id_8,
    input  tri0  id_4,
    output logic id_5,
    input  wand  _id_6
);
  wire _id_9;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_4,
      id_1,
      id_4,
      id_4
  );
  assign modCall_1.id_3 = 0;
  wire [id_9 : id_6] id_10;
  always id_5 <= id_1;
endmodule
