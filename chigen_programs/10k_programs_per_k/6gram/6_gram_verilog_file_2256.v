// Seed: 4107315786
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  logic id_4 = id_1;
endmodule
module module_1 #(
    parameter id_11 = 32'd0,
    parameter id_13 = 32'd46
) (
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
    _id_11,
    id_12,
    _id_13,
    id_14,
    id_15,
    id_16
);
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_6
  );
  inout wire _id_13;
  output wire id_12;
  inout wire _id_11;
  input wire id_10;
  inout reg id_9;
  input wire id_8;
  output wire id_7;
  inout wor id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output logic [7:0] id_2;
  output wire id_1;
  assign id_6 = -1'b0;
  always @(posedge 1 or 1) begin : LABEL_0
    id_2[id_11 : id_13] = id_13;
  end
  always @(posedge id_9 or negedge id_11 == -1) begin : LABEL_1
    id_9 <= -1;
  end
endmodule
