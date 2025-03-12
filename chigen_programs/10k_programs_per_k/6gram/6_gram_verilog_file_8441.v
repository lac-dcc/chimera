// Seed: 118609797
module module_0 #(
    parameter id_10 = 32'd49
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_5 = "";
  wire  id_6;
  localparam id_7 = 1;
  reg
      id_8,
      id_9,
      _id_10,
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
      id_23,
      id_24,
      id_25,
      id_26,
      id_27,
      id_28,
      id_29,
      id_30,
      id_31,
      id_32,
      id_33,
      id_34,
      id_35,
      id_36,
      id_37;
  wire [id_10 : -1] id_38;
  initial id_29 = #1 id_5 == id_25;
endmodule
module module_0 #(
    parameter id_11 = 32'd11,
    parameter id_12 = 32'd40,
    parameter id_9  = 32'd67
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
    id_10,
    _id_11,
    _id_12,
    module_1
);
  inout reg id_13;
  input wire _id_12;
  input wire _id_11;
  input wire id_10;
  output wire _id_9;
  output wire id_8;
  input logic [7:0] id_7;
  input wire id_6;
  module_0 modCall_1 (
      id_1,
      id_8,
      id_1,
      id_8
  );
  assign modCall_1.id_37 = 0;
  output wire id_5;
  nor primCall (id_8, id_3, id_10, id_7, id_4, id_6);
  input logic [7:0] id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  tri0 id_14 = -1, id_15 = id_7 ? id_11 : -1'b0;
  assign id_13 = -1;
  logic id_16, id_17;
  always @(id_10, posedge id_12) id_13 = 1;
endmodule
