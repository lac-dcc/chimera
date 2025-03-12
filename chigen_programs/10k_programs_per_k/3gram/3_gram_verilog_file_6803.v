// Seed: 1388765329
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21
);
  inout wire id_21;
  inout wire id_20;
  input wire id_19;
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output tri id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_5,
      id_4,
      id_1,
      id_3,
      id_1,
      id_5,
      id_1,
      id_5,
      id_3,
      id_2,
      id_5,
      id_1,
      id_1,
      id_5,
      id_4,
      id_4,
      id_1,
      id_1,
      id_5
  );
  assign modCall_1.id_4 = 0;
  output wire id_2;
  inout wire id_1;
  wire id_6 = id_1;
  localparam id_7 = 1;
endmodule
