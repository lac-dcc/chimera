// Seed: 624859435
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
    id_10
);
  input wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  generate
    assign id_5 = id_8;
  endgenerate
endmodule
module module_1 #(
    parameter id_11 = 32'd54,
    parameter id_6  = 32'd73
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    _id_11,
    id_12
);
  input logic [7:0] id_12;
  input wire _id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire _id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output tri1 id_2;
  inout wire id_1;
  logic [7:0] id_13;
  ;
  wire id_14;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_9,
      id_10,
      id_5,
      id_14,
      id_4,
      id_7,
      id_10,
      id_1
  );
  wire [1 'b0 : id_11] id_15;
  wire id_16;
  assign id_2 = id_16 - -1;
  always @(id_12 or posedge id_12[-1'b0==1 : 1]) begin : LABEL_0
    id_13[id_6] <= id_8 < id_12;
  end
  wire id_17;
endmodule
