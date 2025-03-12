// Seed: 1775639964
module module_0 (
    input wire id_0,
    input tri0 id_1,
    input supply0 id_2,
    output wand id_3,
    output tri1 id_4,
    input tri1 id_5,
    output wand id_6,
    input wor id_7,
    output wire id_8,
    input wire id_9,
    output wor id_10,
    input wire id_11,
    input wor id_12,
    input supply1 id_13,
    output tri0 id_14,
    input wire id_15
);
  logic id_17;
  assign id_14 = 1;
  assign id_14 = -1;
endmodule
module module_1 (
    output wire id_0,
    input supply0 id_1,
    output logic id_2,
    input tri1 id_3,
    output wor id_4,
    output uwire id_5,
    output wand id_6,
    output wire id_7
);
  assign id_7 = 1;
  assign id_6 = 1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3,
      id_0,
      id_6,
      id_1,
      id_5,
      id_3,
      id_6,
      id_3,
      id_0,
      id_1,
      id_3,
      id_3,
      id_4,
      id_3
  );
  assign modCall_1.id_1 = 0;
  always @(negedge (-1'b0)) begin : LABEL_0
    id_2 <= id_3;
  end
endmodule
