// Seed: 450469493
module module_0 #(
    parameter id_6 = 32'd16,
    parameter id_8 = 32'd16
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    _id_8
);
  inout wire _id_8;
  output tri1 id_7;
  input wire _id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_9;
  assign module_1.id_6 = 0;
  bit [id_6 : id_8] id_10;
  assign id_5 = id_3;
  always begin : LABEL_0
    id_10 = 1;
  end
  assign id_7 = 1'b0;
  wand id_11 = 1;
  assign id_10 = id_8;
  logic id_12;
  ;
  wire id_13;
  wire id_14;
  assign id_1 = id_12;
  assign id_7 = 1;
  assign id_8 = id_13;
  wire id_15;
  ;
endmodule
module module_1 #(
    parameter id_10 = 32'd59,
    parameter id_4  = 32'd86,
    parameter id_8  = 32'd9
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire _id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_6 = 1'h0;
  localparam id_8 = -1;
  wire [1 : 1] id_9;
  parameter id_10 = id_8 - 1 == id_8;
  wire [-1 : id_4] id_11;
  wire [-1  ==?  id_8 : (  id_8  -  id_10  )] id_12;
  module_0 modCall_1 (
      id_12,
      id_7,
      id_12,
      id_9,
      id_9,
      id_10,
      id_11,
      id_8
  );
endmodule
