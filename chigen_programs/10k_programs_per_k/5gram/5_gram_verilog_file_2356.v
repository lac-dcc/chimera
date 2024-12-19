// Seed: 2154750115
module module_0 (
    output tri id_0,
    input wor id_1,
    output tri0 id_2,
    input supply0 id_3,
    output wire id_4
);
  wire id_6;
  assign id_0 = id_1;
endmodule
module module_1 (
    input tri0 id_0,
    output uwire id_1,
    input wand id_2,
    input tri0 id_3,
    input wand id_4,
    output wire id_5,
    output wor id_6,
    output tri id_7,
    output wor id_8,
    input supply1 id_9,
    input tri id_10,
    input supply1 id_11,
    output supply0 id_12,
    output wor id_13,
    output logic id_14,
    input wire id_15,
    input supply0 id_16,
    input tri0 id_17,
    output supply1 id_18
);
  assign id_1 = 1;
  assign (weak1, strong0) id_5 = id_10;
  always @(1 or negedge 1) begin : LABEL_0
    id_5 = 1;
    if (1)
      if (1) begin : LABEL_0
        id_14 <= 1'b0;
      end
  end
  and primCall (id_1, id_0, id_3, id_4, id_17, id_11, id_15, id_9, id_2, id_16, id_10);
  module_0 modCall_1 (
      id_18,
      id_10,
      id_6,
      id_9,
      id_1
  );
  assign modCall_1.type_0 = 0;
  wire id_20;
  wire id_21;
endmodule
