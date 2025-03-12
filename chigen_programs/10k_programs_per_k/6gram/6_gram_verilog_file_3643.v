// Seed: 527508879
module module_0 (
    input supply1 id_0,
    output wand id_1,
    input wor id_2,
    input wire id_3,
    output supply1 id_4,
    input supply1 id_5,
    output wand id_6,
    input wor id_7,
    input wire id_8,
    input uwire id_9,
    output tri0 id_10,
    input tri0 id_11,
    output supply1 id_12,
    input wor id_13,
    input wire id_14,
    input wand id_15,
    input wand id_16,
    input tri id_17,
    output tri id_18,
    input tri0 id_19,
    input tri id_20,
    input wand id_21,
    input tri id_22,
    input tri0 id_23,
    input tri1 id_24,
    input wor id_25,
    output tri id_26,
    input tri0 id_27
);
  assign id_12 = id_9 == 1;
  assign module_1.id_15 = 0;
endmodule
module module_1 (
    output wand id_0,
    input tri id_1,
    output logic id_2,
    input supply0 id_3,
    input uwire id_4,
    input uwire id_5,
    input wand id_6,
    input tri1 id_7,
    input wire id_8,
    input uwire id_9,
    input supply0 id_10,
    input tri0 id_11,
    input supply0 id_12,
    input tri1 id_13,
    output wire id_14,
    output tri1 id_15,
    output uwire id_16
);
  assign id_14 = 1;
  parameter id_18 = 1;
  generate
    for (id_19 = 1 ^ id_1; id_4; id_2 = id_6) begin : LABEL_0
      assign id_0 = {1, -1, id_7};
    end
  endgenerate
  module_0 modCall_1 (
      id_4,
      id_16,
      id_6,
      id_5,
      id_0,
      id_3,
      id_0,
      id_9,
      id_9,
      id_3,
      id_14,
      id_13,
      id_15,
      id_6,
      id_4,
      id_10,
      id_4,
      id_7,
      id_16,
      id_8,
      id_9,
      id_3,
      id_10,
      id_12,
      id_4,
      id_9,
      id_16,
      id_11
  );
endmodule
