// Seed: 1089812012
module module_0 (
    output supply1 id_0,
    output supply0 id_1,
    output wor id_2,
    input tri0 id_3,
    input wand id_4,
    output wire id_5,
    input tri id_6,
    input wire id_7,
    input supply0 id_8,
    output uwire id_9,
    input tri id_10,
    input wand id_11,
    input wire id_12,
    input uwire id_13,
    output tri1 id_14,
    output tri id_15,
    input wand id_16,
    input tri0 id_17,
    output wire id_18,
    input supply1 id_19,
    output supply1 id_20,
    input supply1 id_21
);
  assign id_20 = id_16;
endmodule
module module_1 (
    output tri0  id_0,
    input  tri0  id_1,
    input  tri   id_2,
    output logic id_3
);
  always @(id_1) begin : LABEL_0
    id_3 <= 1;
  end
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_1,
      id_2,
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0,
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.id_19 = 0;
endmodule
