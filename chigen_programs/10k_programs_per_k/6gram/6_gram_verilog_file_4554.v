// Seed: 2790658063
module module_0 (
    output wor id_0,
    input wor id_1,
    input tri1 id_2,
    input tri1 id_3,
    output wand id_4
    , id_18,
    input uwire id_5,
    input uwire id_6,
    input tri0 id_7,
    input supply0 id_8,
    output tri1 id_9,
    output supply1 id_10,
    input uwire id_11,
    input uwire id_12,
    input uwire id_13,
    input wire id_14,
    input tri0 id_15,
    input supply0 id_16
);
  tri1 id_19 = 1;
  rtran (id_10, id_15, 1);
  assign id_10 = 1 & id_11;
  wire id_20;
  always @(posedge 1 or negedge id_19 == 1) begin : LABEL_0
    id_18 <= 1'b0;
  end
endmodule
module module_1 (
    input  wand id_0,
    input  wire id_1,
    output wand id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.type_22 = 0;
endmodule
