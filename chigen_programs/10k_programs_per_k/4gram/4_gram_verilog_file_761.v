// Seed: 2191511962
module module_0 (
    input wor id_0
    , id_10,
    output supply1 id_1,
    input tri0 id_2,
    input wor id_3,
    output supply1 id_4,
    input wire id_5,
    input tri1 id_6,
    input uwire id_7,
    output wor id_8
);
  wire id_11;
endmodule
module module_1 (
    input  tri0 id_0,
    input  wand id_1,
    output wand id_2,
    input  tri0 id_3
);
  reg id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1,
      id_2
  );
  assign modCall_1.type_2 = 0;
  always @(*) begin : LABEL_0
    id_7 <= id_10;
  end
endmodule
