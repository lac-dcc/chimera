// Seed: 3509955387
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign module_1.id_13 = 0;
  logic id_6;
  wire  id_7;
  wire  id_8;
endmodule
module module_1 #(
    parameter id_10 = 32'd31,
    parameter id_7  = 32'd32,
    parameter id_8  = 32'd22
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    _id_8,
    id_9,
    _id_10
);
  inout wire _id_10;
  input wire id_9;
  inout wire _id_8;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_6,
      id_1,
      id_6
  );
  inout wire _id_7;
  inout wire id_6;
  inout wire id_5;
  inout logic [7:0] id_4;
  inout logic [7:0] id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4[id_10?id_8 : 1] = 1 == id_7;
  wire id_11;
  wire id_12;
  wand id_13 = -1;
  assign id_3[id_7] = id_6 + -1;
endmodule
