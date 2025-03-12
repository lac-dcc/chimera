// Seed: 3193468458
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
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_14 = id_3;
endmodule
module module_1 #(
    parameter id_10 = 32'd79
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  input logic [7:0] id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  inout tri id_12;
  input logic [7:0] id_11;
  input wire _id_10;
  inout logic [7:0] id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wor id_1;
  wire [-1 : !  -1] id_17;
  assign id_9[1'h0] = "";
  assign id_1 = id_11[id_10] ? ~1 : 1 ? id_15 : id_15 + 1'b0;
  assign id_12 = 1;
  xor primCall (id_12, id_15, id_11, id_7, id_8, id_17, id_9, id_16, id_1, id_3);
  module_0 modCall_1 (
      id_17,
      id_12,
      id_12,
      id_12,
      id_5,
      id_2,
      id_13,
      id_4,
      id_1,
      id_17,
      id_17,
      id_8,
      id_7,
      id_12
  );
  wire  id_18;
  logic id_19;
  parameter id_20 = 1;
endmodule
