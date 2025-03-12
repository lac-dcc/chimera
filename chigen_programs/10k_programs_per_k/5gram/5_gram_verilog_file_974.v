// Seed: 56663139
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  output tri0 id_4;
  inout wire id_3;
  input wire id_2;
  input logic [7:0] id_1;
  assign id_4 = id_1[1] ? -1 == id_5 : 1;
endmodule
module module_1 #(
    parameter id_17 = 32'd96,
    parameter id_19 = 32'd18,
    parameter id_20 = 32'd41,
    parameter id_5  = 32'd53
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    _id_17,
    id_18,
    _id_19,
    _id_20
);
  inout wire _id_20;
  inout wire _id_19;
  input wire id_18;
  inout wire _id_17;
  output wire id_16;
  module_0 modCall_1 (
      id_7,
      id_11,
      id_11,
      id_11,
      id_4,
      id_2
  );
  output reg id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  inout logic [7:0] id_7;
  input wire id_6;
  input wire _id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_7[id_5] = id_17;
  logic [id_20 : ""] id_21 = -1'b0 && id_17;
  wire [id_19 : id_17] id_22;
  assign id_15 = 1;
  always @(posedge -1) begin : LABEL_0
    if (1 & (1)) if (1) id_15 = 1;
  end
endmodule
