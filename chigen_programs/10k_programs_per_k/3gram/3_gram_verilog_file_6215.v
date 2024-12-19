// Seed: 1221166336
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(1 or posedge id_8) if (1) id_1 = id_4;
  assign id_6 = id_4;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_9;
  always_ff @(id_5, negedge 1) begin : LABEL_0
    id_8 = id_1;
  end
  module_0 modCall_1 (
      id_1,
      id_9,
      id_5,
      id_9,
      id_6,
      id_6,
      id_7,
      id_1
  );
  final $display(id_5 - id_1, 1'h0);
endmodule
