// Seed: 2658251176
module module_0 (
    input tri0 id_0,
    input wire id_1,
    output tri id_2,
    output supply1 id_3,
    input tri0 id_4,
    output tri1 id_5,
    output tri1 id_6,
    input supply0 id_7,
    input wor id_8,
    output wire id_9,
    input wand id_10,
    input tri0 id_11,
    input tri1 id_12,
    input tri id_13,
    input supply1 id_14
    , id_17,
    output tri id_15
);
  generate
    for (id_18 = 1; id_7 == 1 - id_8; id_15 = 1) begin : LABEL_0
      wire id_19;
    end
  endgenerate
  wire id_20;
  wire id_21;
endmodule
module module_1 (
    output logic id_0,
    input  tri   id_1,
    output wor   id_2,
    output logic id_3,
    input  wand  id_4,
    input  tri0  id_5
);
  always @(1 or negedge 1) begin : LABEL_0
    id_0 <= 1;
    if (1'b0) id_3 <= 1'b0;
    else $display(id_4, 1 == 1);
  end
  module_0 modCall_1 (
      id_1,
      id_5,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_4,
      id_1,
      id_2,
      id_5,
      id_1,
      id_1,
      id_1,
      id_4,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
