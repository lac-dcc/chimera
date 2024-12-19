// Seed: 305114387
module module_0 (
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
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge 1 or posedge id_3) begin : LABEL_0
    id_8 <= 1;
  end
  wire id_15;
  wire id_16;
  timeunit 1ps;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1[1'b0] = id_2;
  always force id_3 = id_3;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_2,
      id_4,
      id_2,
      id_4,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
endmodule
