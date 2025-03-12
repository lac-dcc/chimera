// Seed: 1493331807
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output supply1 id_1;
  assign id_1 = 1;
  wire id_10;
  wire id_11;
  assign id_5 = id_6 ? -1 : id_5;
endmodule
module module_1 (
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
    id_13
);
  output wire id_13;
  xnor primCall (id_11, id_12, id_9, id_10, id_7, id_8);
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_10,
      id_5,
      id_12,
      id_12,
      id_9,
      id_10,
      id_12
  );
  input wire id_9;
  input wire id_8;
  input logic [7:0] id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  genvar id_14;
  logic id_15 = id_7[1'b0 : 1];
  wire  id_16;
endmodule
