// Seed: 1216724055
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    module_0
);
  output wire id_9;
  input wire id_8;
  inout wor id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_10;
  assign id_7 = -1'h0;
endmodule
module module_1 #(
    parameter id_10 = 32'd80,
    parameter id_12 = 32'd42,
    parameter id_2  = 32'd54,
    parameter id_5  = 32'd33
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    _id_12
);
  input wire _id_12;
  input wire id_11;
  inout wire _id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout logic [7:0] id_6;
  input wire _id_5;
  input wire id_4;
  input wire id_3;
  input wire _id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_9,
      id_7,
      id_7,
      id_7,
      id_8,
      id_8,
      id_7,
      id_8,
      id_8
  );
  logic [id_12  <<  1 : id_2] id_13;
  wire [1 : 1] id_14;
  logic [1 : id_10] id_15;
  parameter id_16 = -1;
  always @(posedge id_5 * id_13 - -1 or negedge -1) begin : LABEL_0
    release id_13;
  end
  assign id_9 = id_6[id_5];
endmodule
