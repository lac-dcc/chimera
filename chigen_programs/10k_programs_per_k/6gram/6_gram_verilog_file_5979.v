// Seed: 1963642515
module module_0 (
    input wor id_0,
    output tri0 id_1,
    output supply1 id_2,
    output tri id_3,
    input supply1 id_4,
    input uwire id_5,
    output wor id_6,
    input tri1 id_7,
    input wor id_8,
    input wor id_9,
    input supply1 id_10,
    output wire id_11,
    input tri1 id_12,
    input uwire id_13,
    input supply1 id_14,
    input wor id_15,
    input tri id_16,
    input tri0 id_17,
    input wand id_18,
    output uwire id_19,
    input tri1 id_20,
    input supply1 id_21,
    input wand id_22,
    input wor id_23,
    input supply0 id_24
);
  wand id_26 = 1;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input wand id_0,
    input tri1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input wand id_4,
    input logic id_5,
    output wand id_6,
    output tri1 id_7,
    input wor id_8,
    output logic id_9,
    output wand id_10,
    output supply0 id_11,
    input wor id_12,
    input wor id_13,
    input wire id_14,
    input tri1 id_15,
    input tri1 id_16,
    output logic id_17,
    input supply0 id_18,
    input wor id_19,
    input wor id_20,
    input tri0 id_21,
    output supply0 id_22
);
  assign id_7 = 1'b0;
  assign id_9 = id_5;
  module_0 modCall_1 (
      id_20,
      id_11,
      id_11,
      id_10,
      id_3,
      id_0,
      id_7,
      id_19,
      id_19,
      id_20,
      id_14,
      id_11,
      id_18,
      id_14,
      id_4,
      id_0,
      id_12,
      id_18,
      id_4,
      id_7,
      id_2,
      id_2,
      id_1,
      id_1,
      id_4
  );
  assign id_7 = (1 >> 1);
  initial begin : LABEL_0
    id_9  <= 1;
    id_17 <= id_5;
  end
endmodule
