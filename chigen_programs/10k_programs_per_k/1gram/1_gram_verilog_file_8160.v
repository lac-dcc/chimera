// Seed: 97287056
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    input supply1 id_2,
    input tri0 id_3,
    output wire id_4
);
  logic id_6;
  ;
  assign id_4 = 1'b0;
  assign id_4 = id_3;
  wire id_7, id_8;
  always id_6 <= 1;
  logic id_9;
  ;
endmodule
module module_1 #(
    parameter id_11 = 32'd3
) (
    input wire id_0
    , id_14,
    input wand id_1,
    input tri id_2,
    input supply0 id_3
    , id_15 = 1 + 1,
    output wand id_4,
    output supply1 id_5,
    input tri1 id_6,
    input supply1 id_7[1 'b0 : id_11],
    output tri0 id_8,
    input supply0 id_9,
    input wor id_10,
    output tri0 _id_11,
    input supply0 id_12
);
  wire id_16;
  module_0 modCall_1 (
      id_0,
      id_8,
      id_12,
      id_6,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
