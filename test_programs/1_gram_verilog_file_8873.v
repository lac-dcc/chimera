// Seed: 494233648
macromodule module_0 (
    output tri0 id_0,
    output wire id_1,
    input wire id_2,
    input supply0 id_3,
    input tri1 id_4,
    input wand id_5,
    input uwire id_6,
    input tri0 id_7,
    input wire id_8,
    output wire id_9,
    output tri0 id_10,
    output wor id_11,
    input tri0 id_12,
    input supply1 id_13,
    output wor id_14,
    input supply1 id_15,
    input wand id_16,
    input wor id_17,
    input wor id_18
);
  wire id_20;
  assign module_1.type_3 = 0;
  assign id_1 = id_7;
endmodule
module module_1 (
    output logic id_0,
    input tri id_1,
    input logic id_2,
    input tri1 void id_3,
    input tri0 id_4,
    output logic id_5,
    input wor id_6,
    input wor id_7,
    output tri1 id_8,
    id_11,
    output tri0 id_9
);
  initial
    if (id_3) begin : LABEL_0
      id_5 <= id_2;
      id_0 <= -1;
    end else id_0 = 1;
  module_0 modCall_1 (
      id_9,
      id_8,
      id_1,
      id_7,
      id_7,
      id_1,
      id_6,
      id_6,
      id_3,
      id_8,
      id_9,
      id_8,
      id_6,
      id_3,
      id_8,
      id_4,
      id_3,
      id_7,
      id_4
  );
endmodule
