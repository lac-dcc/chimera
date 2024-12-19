// Seed: 3885298984
module module_0 (
    input supply1 id_0,
    input tri0 id_1
    , id_17,
    input wor id_2,
    input tri1 id_3
    , id_18,
    input supply1 id_4,
    input supply1 id_5,
    input wand id_6,
    input tri0 id_7,
    input tri id_8,
    input tri1 id_9,
    output tri0 id_10,
    input uwire id_11,
    input tri1 id_12,
    input tri0 id_13,
    input supply0 id_14,
    output wire id_15
);
  wire id_19;
  wire id_20;
  always begin : LABEL_0
    id_17 = id_7;
  end
  wire id_21;
  tri1 id_22 = 1;
  supply0 id_23 = id_8;
endmodule
module module_1 (
    input tri id_0,
    input uwire id_1,
    input supply1 id_2,
    output tri id_3,
    input supply1 id_4,
    input supply0 id_5,
    input uwire id_6,
    input wand id_7,
    input tri0 id_8,
    output logic id_9
);
  tri0 id_11;
  reg  id_12;
  always @(negedge 1 & id_12) begin : LABEL_0
    id_11 = 1;
    id_12 <= 1;
  end
  assign id_9 = 1'b0 * id_8;
  always @(id_4 or negedge id_5) id_9 = #1 1 === id_11;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_8,
      id_5,
      id_6,
      id_5,
      id_5,
      id_7,
      id_1,
      id_0,
      id_3,
      id_1,
      id_5,
      id_7,
      id_0,
      id_3
  );
  assign modCall_1.id_15 = 0;
endmodule
