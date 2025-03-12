// Seed: 2942386264
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
    id_15,
    id_16
);
  input wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  inout reg id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  inout logic [7:0] id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_8[-1] = id_1;
  wire id_17;
  always @(posedge id_17 or posedge 1 == -1) begin : LABEL_0
    id_12 = id_2;
  end
  logic ["" : 1] id_18;
  ;
endmodule
module module_1 #(
    parameter id_9 = 32'd96
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10
);
  input wire id_10;
  input wire _id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  localparam id_11 = 1;
  integer id_12 = !id_2;
  logic [id_9 : 1 'b0] id_13;
  ;
  initial #1 id_12 = 1;
  assign id_7 = id_6;
  assign id_13[1'd0] = id_4;
  supply0 [-1 : -1] id_14;
  assign id_14 = 1'd0;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_7,
      id_4,
      id_14,
      id_8,
      id_6,
      id_13,
      id_11,
      id_7,
      id_14,
      id_12,
      id_14,
      id_7,
      id_7,
      id_6
  );
  parameter id_15 = 1;
  logic [-1 : 1] id_16;
  ;
endmodule
