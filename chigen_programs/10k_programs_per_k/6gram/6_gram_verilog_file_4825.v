// Seed: 1424163266
module module_0 #(
    parameter id_4 = 32'd29
) (
    id_1,
    id_2,
    id_3
);
  output logic [7:0] id_3;
  inout wire id_2;
  output wire id_1;
  logic _id_4;
  assign id_3[id_4] = -1 == 1;
endmodule
module module_1 #(
    parameter id_11 = 32'd68,
    parameter id_5  = 32'd39
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    _id_11
);
  inout wire _id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout reg id_6;
  input wire _id_5;
  input wire id_4;
  inout logic [7:0] id_3;
  output wire id_2;
  input wire id_1;
  wire [id_5 : 1] id_12;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_3
  );
  wire [-1  & "" : id_11] id_13;
  always @(posedge id_11) begin : LABEL_0
    if (1 - -1'b0) begin : LABEL_1
      id_6 = 1;
    end
  end
  assign (strong0, weak1) id_6 = id_6;
  timeunit 1ps / 1ps;
endmodule
