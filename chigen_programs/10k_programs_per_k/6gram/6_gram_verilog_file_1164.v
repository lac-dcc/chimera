// Seed: 2092460078
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input wor id_2,
    input tri0 id_3,
    input wor id_4,
    output supply0 id_5,
    input tri0 id_6,
    input tri0 id_7,
    output tri id_8,
    input tri1 id_9,
    output supply0 id_10,
    output tri0 id_11,
    input wand id_12,
    input wire id_13,
    input wire id_14,
    output tri0 id_15,
    output tri1 id_16
);
  wire id_18;
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    input wand id_0,
    output wire id_1,
    output logic id_2,
    input tri0 module_1,
    input tri id_4,
    input supply0 id_5,
    output logic id_6,
    input wire id_7,
    input logic id_8,
    input wire id_9,
    input tri0 id_10,
    input wire id_11,
    output wire id_12
);
  always @(id_8) begin : LABEL_0
    id_2 <= id_8;
    id_6 <= 1;
  end
  module_0 modCall_1 (
      id_10,
      id_4,
      id_9,
      id_5,
      id_0,
      id_12,
      id_5,
      id_7,
      id_1,
      id_0,
      id_12,
      id_1,
      id_5,
      id_7,
      id_10,
      id_12,
      id_1
  );
endmodule
