// Seed: 1368322657
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
    id_11
);
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign module_1.id_6 = 0;
  wire id_12;
endmodule
module module_1 #(
    parameter id_12 = 32'd2,
    parameter id_5  = 32'd17
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  nor primCall (id_3, id_1, id_15, id_13, id_2, id_11, id_4, id_7, id_16, id_12);
  output wire id_6;
  inout wire _id_5;
  input wire id_4;
  output reg id_3;
  input wire id_2;
  inout reg id_1;
  parameter id_9 = "";
  wand id_10;
  wire id_11;
  parameter id_12 = id_9;
  wire [id_5 : id_12] id_13;
  always for (id_6 = -1'h0; id_7; id_1 = id_13) assume #1  (id_9);
  assign id_10 = -1'd0;
  assign id_1  = -1;
  wire id_14;
  wire id_15;
  wire [-1 : 1 'b0] id_16;
  always id_3 = id_2;
  module_0 modCall_1 (
      id_8,
      id_16,
      id_15,
      id_14,
      id_9,
      id_16,
      id_16,
      id_15,
      id_10,
      id_13,
      id_9
  );
endmodule
