// Seed: 3657690751
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    input wire id_2,
    input tri1 id_3
);
  wire id_5;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    output wand id_2,
    input supply0 id_3,
    input logic id_4,
    input tri1 id_5,
    input wire id_6,
    output logic id_7
);
  logic id_9;
  initial begin : LABEL_0
    id_9 = id_4;
    id_7 <= id_9 != 1;
  end
  wire id_10;
  assign id_7 = id_4;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_6
  );
  wire id_11;
  always @(1 or negedge 1'b0) @(1) id_9 = 1 - 1'b0;
endmodule
