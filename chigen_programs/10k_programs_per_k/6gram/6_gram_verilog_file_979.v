// Seed: 3767552171
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout logic [7:0] id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5[1] = -1 != 1 ? 1 : id_3 == id_3;
  assign id_5 = id_1;
endmodule
module module_1 #(
    parameter id_1  = 32'd69,
    parameter id_12 = 32'd67,
    parameter id_14 = 32'd93,
    parameter id_4  = 32'd56,
    parameter id_7  = 32'd11
) (
    _id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    _id_12,
    id_13
);
  inout wire id_13;
  inout wire _id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire _id_7;
  output reg id_6;
  inout wire id_5;
  output wire _id_4;
  inout wire id_3;
  input wire id_2;
  input wire _id_1;
  wire [1 : id_7] _id_14;
  parameter id_15 = (-1 - 1);
  wire id_16 = id_7;
  genvar id_17;
  wire [id_14 : 1] id_18;
  assign id_9 = id_15[(1) : id_1];
  module_0 modCall_1 (
      id_8,
      id_3,
      id_5,
      id_3,
      id_15,
      id_16
  );
  logic [id_4 : 1 'd0] id_19;
  ;
  logic id_20;
  ;
  wire [-1 : id_12] id_21;
  assign id_10 = id_13;
  always @(posedge id_2 or id_3) begin : LABEL_0
    id_6 <= (id_19[$realtime]);
  end
  and primCall (id_9, id_8, id_2, id_17, id_15, id_3, id_13, id_18, id_5);
endmodule
