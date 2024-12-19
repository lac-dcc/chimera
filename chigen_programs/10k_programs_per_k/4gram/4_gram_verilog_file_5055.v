// Seed: 274736341
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
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_8 = 1;
  assign module_1.id_12 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  always @('b0 or id_3) begin : LABEL_0
    id_2 <= 1'b0;
    id_12 = 1;
    id_5 <= 1;
    id_4 <= &1;
  end
  wire id_13;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_8,
      id_3,
      id_12,
      id_13,
      id_8,
      id_13
  );
  always @(1 or posedge 1'b0) id_12 = 1;
  assign id_3 = 1'b0;
endmodule
