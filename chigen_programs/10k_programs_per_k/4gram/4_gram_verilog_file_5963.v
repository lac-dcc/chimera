// Seed: 2675806480
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_4 = -1'b0;
  always @(id_2 or posedge id_4) begin : LABEL_0
    id_4 = -1'b0 != -1;
  end
  always @(posedge 'd0) begin : LABEL_1
    id_4 = -1;
  end
  final begin : LABEL_2
    id_4 = id_4;
  end
  logic id_5 = -1;
  logic id_6;
  assign id_5 = 1 ? id_2 : -1;
endmodule
module module_1 #(
    parameter id_2 = 32'd35
) (
    id_1,
    _id_2,
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
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23
);
  input wire id_23;
  output wire id_22;
  output wire id_21;
  inout wire id_20;
  output wire id_19;
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  module_0 modCall_1 (
      id_21,
      id_17,
      id_8
  );
  assign modCall_1.id_4 = 0;
  output wire id_15;
  input logic [7:0] id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  nor primCall (
      id_21,
      id_8,
      id_20,
      id_4,
      id_9,
      id_5,
      id_18,
      id_23,
      id_3,
      id_14,
      id_16,
      id_13,
      id_17,
      id_1,
      id_6
  );
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire _id_2;
  input wire id_1;
  logic [-1 'h0 : 1] id_24 = id_14[id_2] > -1;
endmodule
