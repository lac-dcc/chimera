// Seed: 3134037631
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    input supply1 id_2,
    input wire id_3,
    input tri1 id_4,
    input wire id_5,
    output wire id_6,
    input supply1 id_7
);
  generate
    if (id_5) begin : LABEL_0
      assign id_6 = 1;
    end
  endgenerate
  assign module_1.type_5 = 0;
endmodule
module module_3 (
    output tri1 id_0,
    output supply1 id_1,
    output uwire id_2,
    output supply1 id_3,
    output wand id_4,
    input tri id_5,
    input wor module_1,
    input wand id_7,
    input tri1 id_8,
    output logic id_9,
    output uwire id_10,
    input tri0 id_11,
    input tri1 id_12,
    output wor id_13,
    input tri id_14,
    input tri1 id_15,
    output tri0 id_16,
    input wand id_17
);
  always_latch @(1) begin : LABEL_0
    if (id_7 == 1) begin : LABEL_0
      force id_9 = 1;
      id_13 = 1;
      id_9 <= 1 == 1 - 1;
    end
  end
  module_0 modCall_1 (
      id_5,
      id_11,
      id_17,
      id_12,
      id_15,
      id_14,
      id_13,
      id_12
  );
endmodule
