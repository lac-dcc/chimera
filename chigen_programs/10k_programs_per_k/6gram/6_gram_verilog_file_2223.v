// Seed: 831524091
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
    id_14,
    id_15
);
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout reg id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_16;
  always @(posedge id_8 or posedge id_6) begin : LABEL_0
    id_4 <= id_1;
  end
endmodule
module module_1 #(
    parameter id_3 = 32'd46
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout logic [7:0] id_5;
  inout wire id_4;
  input wire _id_3;
  output wire id_2;
  output wire id_1;
  parameter id_7 = -1;
  assign id_5[1] = id_3;
  wire [1 : id_3] id_8;
  assign id_1 = id_5;
  logic [-1 'd0 ===  -1 : -1] id_9, id_10, id_11, id_12, id_13;
  localparam id_14 = 1'b0;
  parameter id_15 = id_7;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_4,
      id_9,
      id_8,
      id_8,
      id_14,
      id_14,
      id_4,
      id_15,
      id_14,
      id_2,
      id_4,
      id_14,
      id_15
  );
  always @(posedge id_8) begin : LABEL_0
    id_13 <= id_15;
  end
  assign id_11 = 1'b0;
endmodule
