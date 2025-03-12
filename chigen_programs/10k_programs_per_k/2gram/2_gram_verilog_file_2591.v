// Seed: 1086170443
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
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  pullup (1, -1 & 1);
  parameter id_12 = 1'd0;
endmodule
module module_1 #(
    parameter id_5 = 32'd4,
    parameter id_9 = 32'd93
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
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire _id_5;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_6,
      id_3,
      id_3,
      id_3,
      id_6,
      id_6,
      id_3,
      id_7,
      id_3
  );
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire _id_9;
  wire id_10;
  always_latch @(-1 or id_5);
  wire [id_9 : {  1 'd0 {  id_5  }  }] id_11;
  wire id_12;
endmodule
