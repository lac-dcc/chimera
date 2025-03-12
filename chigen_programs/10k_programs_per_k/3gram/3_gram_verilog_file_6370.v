// Seed: 1488623794
program module_0 (
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
    id_15
);
  output wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_16;
  parameter id_17 = 1;
endprogram
module module_1 #(
    parameter id_9 = 32'd32
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
    id_11
);
  output reg id_11;
  inout wire id_10;
  input wire _id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_10,
      id_10,
      id_5,
      id_5,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_5,
      id_2,
      id_10,
      id_8
  );
  wire id_12;
  ;
  logic id_13;
  wire [-1 : -1] id_14;
  wire [-1 : id_9  |  1 'b0 |  1] id_15;
  wire [-1 'h0 : 1] id_16;
  assign id_7 = id_12;
  wire id_17;
  task id_18;
    begin : LABEL_0
      id_11 = id_7 == id_14;
    end
  endtask
endmodule
