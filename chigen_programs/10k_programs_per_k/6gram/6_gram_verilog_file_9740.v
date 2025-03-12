// Seed: 1764595845
module module_0 (
    output wire id_0,
    output tri0 id_1,
    output tri1 id_2,
    input tri1 id_3,
    output tri1 id_4,
    input tri0 id_5,
    input wor id_6,
    input supply0 id_7,
    input wire id_8,
    input wand id_9,
    input tri id_10,
    output supply0 id_11,
    input tri1 id_12,
    input wand id_13,
    input wand id_14,
    output tri1 id_15
);
  assign id_15 = 1;
  assign id_15 = id_6;
  logic id_17;
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    output logic id_2,
    input wor id_3,
    output wor id_4
);
  always @(posedge -1'd0 ^ id_0) begin : LABEL_0
    if (1) id_2 <= id_0;
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_1,
      id_0,
      id_0,
      id_3,
      id_0,
      id_1,
      id_4,
      id_3,
      id_0,
      id_3,
      id_4
  );
  assign modCall_1.id_13 = 0;
endmodule
