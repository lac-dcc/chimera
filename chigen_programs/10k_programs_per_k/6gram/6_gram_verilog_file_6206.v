// Seed: 3267442870
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    output tri id_3,
    input tri0 id_4,
    output wand id_5,
    input wor id_6,
    output tri id_7,
    input tri0 id_8,
    output tri1 id_9,
    input wire id_10,
    output tri1 id_11,
    input tri0 id_12,
    input wand id_13
);
  wire id_15;
  wire id_16;
  wire id_17;
  always @(negedge !1'b0) begin : LABEL_0
    disable id_18;
  end
  assign module_1.type_12 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input tri id_1,
    input supply0 id_2,
    input logic id_3,
    output tri1 id_4,
    output supply1 id_5,
    input uwire id_6,
    input tri1 id_7,
    input tri0 id_8,
    output logic id_9,
    input supply1 id_10,
    input tri1 id_11,
    input supply0 id_12,
    output wor id_13,
    input wor id_14,
    input supply0 id_15,
    input wor id_16
);
  always @(*) begin : LABEL_0
    id_9 <= id_3;
  end
  module_0 modCall_1 (
      id_6,
      id_11,
      id_2,
      id_5,
      id_1,
      id_5,
      id_8,
      id_4,
      id_16,
      id_13,
      id_16,
      id_13,
      id_10,
      id_12
  );
endmodule
