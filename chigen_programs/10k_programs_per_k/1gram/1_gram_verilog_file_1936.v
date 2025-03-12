// Seed: 880386041
module module_0 #(
    parameter id_6 = 32'd33
) (
    id_1,
    id_2[1 :-1],
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output logic [7:0] id_2;
  input wire id_1;
  logic [7:0] id_5, _id_6;
  wire  id_7;
  logic id_8;
  ;
  wire id_9, id_10, id_11;
  logic id_12;
  assign id_2 = id_4;
  logic id_13;
  ;
  assign id_13 = id_9;
  struct {
    logic id_14;
    real  id_15;
  } id_16;
  parameter id_17 = 1;
endmodule
module module_1 #(
    parameter id_13 = 32'd57,
    parameter id_4  = 32'd27
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    _id_13,
    id_14,
    id_15
);
  output wire id_15;
  input wire id_14;
  input wire _id_13;
  output wire id_12;
  inout logic [7:0] id_11;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_10,
      id_5
  );
  output wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire _id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  initial id_11[id_4] = -1;
  initial begin : LABEL_0
    $signed(40);
    ;
  end
  assign id_11 = id_13;
  assign id_11[1 : (id_13)] = id_9;
  localparam id_16 = 1;
endmodule
