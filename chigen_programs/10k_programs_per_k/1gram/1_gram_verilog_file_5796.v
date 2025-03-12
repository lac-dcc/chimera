// Seed: 2535552550
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
    id_10[1'b0-1'd0 :-1],
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  output wire id_12;
  input wire id_11;
  output logic [7:0] id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_14 = id_5;
endmodule
module module_1 #(
    parameter id_13 = 32'd18,
    parameter id_15 = 32'd87,
    parameter id_3  = 32'd12,
    parameter id_8  = 32'd48
) (
    id_1[1 : 1],
    id_2,
    _id_3,
    id_4,
    id_5#(id_6, 1),
    id_7,
    _id_8,
    id_9[1'b0 : id_3],
    id_10,
    id_11,
    id_12,
    _id_13,
    id_14,
    _id_15
);
  input wire id_14;
  inout wire _id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input logic [7:0] id_9;
  input wire _id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire _id_3;
  inout wire id_2;
  output logic [7:0] id_1;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_2,
      id_5,
      id_2,
      id_7,
      id_5,
      id_2,
      id_7,
      id_1,
      id_7,
      id_12,
      id_14
  );
  wire id_16;
  logic [7:0] id_17;
  logic [7:0][-1] id_18;
  assign id_2 = id_14(id_17[id_15/1]);
  wire id_19, id_20;
  wire id_21, id_22;
  tri id_23;
  assign id_23 = -1 + id_6;
  class id_24;
    id_25 id_26;
    logic id_27;
  endclass
  wire [id_13 : id_8] id_28, id_29;
  initial id_25 <= -1;
  logic id_30;
endmodule
