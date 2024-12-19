// Seed: 3123257146
program module_0 (
    output tri1 id_0
    , id_12,
    input supply1 id_1,
    input wand id_2,
    output wor id_3
    , id_13,
    output supply1 id_4,
    output supply0 id_5,
    output tri0 id_6,
    output supply1 id_7,
    output tri1 id_8,
    input supply0 id_9,
    input wire id_10
);
  wire id_14;
  wire id_15;
  assign module_1.type_6 = 0;
endprogram
module module_1 (
    input tri0 id_0,
    output wire id_1,
    output supply1 id_2,
    input logic id_3,
    input supply0 id_4,
    output logic id_5,
    output supply1 id_6,
    input tri0 id_7,
    output wire id_8
);
  generate
    always_ff #1 id_5 <= id_3;
  endgenerate
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_8,
      id_8,
      id_8,
      id_6,
      id_1,
      id_6,
      id_0,
      id_4
  );
  wire id_10;
  wire id_11;
  assign id_11 = id_10;
  wire id_12;
  always @(posedge id_10) begin : LABEL_0
    id_5 <= 1;
  end
endmodule
