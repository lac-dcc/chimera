// Seed: 2314095346
module module_0 (
    input tri0 id_0,
    input wire id_1,
    output wand id_2,
    input wor id_3,
    output wor id_4,
    input supply0 id_5,
    input supply1 id_6,
    output tri id_7,
    input wor id_8
);
  id_10(
      .id_0((1'h0)), .id_1(id_1)
  );
endmodule
module module_1 (
    input  uwire id_0,
    input  tri0  id_1,
    input  tri   id_2,
    input  tri   id_3,
    input  tri0  id_4,
    output logic id_5,
    input  uwire id_6,
    input  wor   id_7,
    output tri   id_8,
    input  wand  id_9,
    input  tri0  id_10,
    input  logic id_11,
    input  logic id_12
);
  always @(negedge 1) begin : LABEL_0
    if (id_1) begin : LABEL_0
      id_5 <= 1 ? id_12 : 1 ? id_11 : 1;
    end
  end
  wire id_14, id_15, id_16, id_17, id_18, id_19, id_20, id_21, id_22, id_23, id_24, id_25;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_8,
      id_2,
      id_8,
      id_9,
      id_0,
      id_8,
      id_4
  );
endmodule
