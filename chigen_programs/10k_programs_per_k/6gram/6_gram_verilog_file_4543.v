// Seed: 1965634917
module module_0 #(
    parameter id_9 = 32'd69
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
    id_11,
    id_12
);
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire _id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  logic [1 : -1 'b0] id_13 = id_7 ==? id_7;
  logic id_14 = -1, id_15;
  wire id_16;
  localparam id_17 = 1'b0;
  wire [1 : id_9] id_18;
  initial begin : LABEL_0
    $signed(76);
    ;
    id_14 <= -1;
  end
endmodule
module module_1 #(
    parameter id_6 = 32'd40,
    parameter id_8 = 32'd49,
    parameter id_9 = 32'd96
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7
);
  inout wire id_7;
  inout wire _id_6;
  inout logic [7:0] id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire _id_8;
  assign id_1 = id_3;
  assign id_5[id_8] = 1;
  wire _id_9;
  wire id_10;
  logic [7:0][id_6 : !  id_9] id_11;
  assign id_8 = id_1;
  assign id_11[1] = 1;
  wire id_12;
  wire id_13;
  module_0 modCall_1 (
      id_12,
      id_13,
      id_10,
      id_12,
      id_7,
      id_10,
      id_7,
      id_7,
      id_8,
      id_4,
      id_13,
      id_7
  );
endmodule
