// Seed: 1852649154
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
    id_13
);
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_14;
  wire id_15;
  wire id_16;
  wire id_17 = id_15;
  always
    if (id_6) #1 id_1 = 1'b0;
    else id_15 -= 1;
  assign id_6 = 1;
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
    id_12
);
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_13 = ~1;
  module_0 modCall_1 (
      id_12,
      id_5,
      id_8,
      id_5,
      id_12,
      id_13,
      id_9,
      id_13,
      id_11,
      id_8,
      id_10,
      id_11,
      id_13
  );
  assign modCall_1.id_1 = 0;
  wire id_14;
  wire id_15;
endmodule
