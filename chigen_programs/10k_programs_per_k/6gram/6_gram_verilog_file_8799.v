// Seed: 438779457
module module_0 (
    output tri0 id_0,
    input tri id_1,
    input wor id_2,
    input uwire id_3,
    input wor id_4,
    input uwire id_5,
    output wire id_6,
    output tri id_7,
    input supply1 id_8,
    input uwire id_9,
    input tri1 id_10,
    output wire id_11,
    input supply1 id_12,
    input wor id_13,
    output wor id_14
);
  logic id_16;
  assign id_7 = -1;
endmodule
module module_1 (
    output tri1 id_0,
    input tri0 id_1,
    output logic id_2,
    output wor id_3,
    output wor id_4,
    input wire id_5,
    output tri0 id_6,
    input tri id_7,
    input supply1 id_8,
    output wand id_9,
    input tri1 id_10
);
  always @(*) begin : LABEL_0
    id_2 <= 1;
  end
  module_0 modCall_1 (
      id_0,
      id_7,
      id_1,
      id_7,
      id_7,
      id_1,
      id_6,
      id_6,
      id_10,
      id_10,
      id_10,
      id_9,
      id_7,
      id_8,
      id_4
  );
  assign modCall_1.id_13 = 0;
endmodule
