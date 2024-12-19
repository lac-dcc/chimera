// Seed: 47862875
module module_0 (
    input tri1 id_0,
    input wand id_1,
    input tri id_2,
    output uwire id_3,
    input wand id_4,
    output uwire id_5,
    input wand id_6,
    input supply1 id_7,
    input tri0 id_8,
    output tri1 id_9,
    input wor id_10,
    input wor id_11,
    output wire id_12,
    output tri0 id_13,
    output tri id_14,
    input wand id_15
    , id_17
);
  wand id_18 = 1 - id_8 ? id_15 : 1;
  tri1 id_19;
  always @(1 & id_19 or negedge 1'b0 or negedge "") begin : LABEL_0
    id_18 = id_15;
    id_17 = 1;
  end
  initial begin : LABEL_0
    if (1) disable id_20;
  end
endmodule
module module_1 (
    input wire id_0,
    output supply0 id_1,
    input supply0 id_2,
    output tri1 id_3,
    input supply0 id_4,
    input wire id_5,
    input wor id_6
    , id_9,
    output wire id_7
);
  assign id_1 = 1'd0 == id_4;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_3,
      id_5,
      id_3,
      id_6,
      id_6,
      id_0,
      id_7,
      id_4,
      id_0,
      id_7,
      id_1,
      id_3,
      id_0
  );
  assign modCall_1.type_22 = 0;
endmodule
