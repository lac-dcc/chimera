// Seed: 902984948
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
    id_13
);
  input wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_14;
  ;
endmodule
module module_1 #(
    parameter id_13 = 32'd31,
    parameter id_16 = 32'd44
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
    id_11,
    id_12
);
  input wire id_12;
  input logic [7:0] id_11;
  inout logic [7:0] id_10;
  input wire id_9;
  input wire id_8;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_8,
      id_5,
      id_6,
      id_5,
      id_5,
      id_1,
      id_12,
      id_1,
      id_1,
      id_1,
      id_5
  );
  input wire id_7;
  output wire id_6;
  inout wand id_5;
  inout wire id_4;
  inout reg id_3;
  output wire id_2;
  inout wire id_1;
  wire _id_13;
  ;
  assign id_6 = id_3;
  always id_3 <= #id_5 -1;
  assign id_5 = id_10 * 1;
  wire [-1 'h0 : 1] id_14;
  wire id_15;
  ;
  logic [-1 : 1] _id_16 = -1;
  assign id_10[-1'b0] = -1;
  wire [id_16 : id_13] id_17;
  wire id_18;
  always @(1'b0)
    if (1) begin : LABEL_0
    end
endmodule
