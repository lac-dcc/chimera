// Seed: 1742323374
module module_0 (
    input tri0 id_0,
    output wand id_1,
    input wand id_2,
    output wire id_3,
    output tri0 id_4,
    input supply1 id_5,
    output wor id_6,
    input tri0 id_7,
    input uwire id_8,
    input tri id_9,
    input wor id_10,
    input supply1 id_11,
    output tri id_12,
    input supply1 id_13,
    output supply0 id_14
);
  always @* begin : LABEL_0
    id_6 = (1);
  end
  always_ff @(1 < id_10) begin : LABEL_0
    if (1)
      if (id_2) {(1), 1} <= 1'b0 * id_11;
      else if (1) id_12 = (id_8);
      else assign id_3[1'b0] = id_10 / id_8;
  end
  wire id_16;
  wire id_17;
  wire id_18;
  wire id_19;
  assign id_3 = id_7;
  always @(posedge 1) begin : LABEL_0
    disable id_20;
  end
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    input tri id_2,
    input wand id_3,
    output wand id_4,
    input wand id_5,
    input supply0 id_6,
    input supply1 id_7,
    input tri id_8,
    input tri0 id_9
);
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_1,
      id_4,
      id_4,
      id_1,
      id_4,
      id_8,
      id_3,
      id_6,
      id_3,
      id_8,
      id_4,
      id_3,
      id_4
  );
  assign modCall_1.type_25 = 0;
  tri1 id_12 = 1, id_13;
endmodule
