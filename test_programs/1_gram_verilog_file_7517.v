// Seed: 3448462771
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
    id_12
);
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always id_7[1'b0] = id_11;
  integer id_13;
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
    id_12#(
        .id_13(-1),
        .id_14(-1),
        .id_15(id_16),
        .id_17(-1)
    ),
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23
);
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_17 = 1;
  nor primCall (
      id_5,
      id_25,
      id_19,
      id_23,
      id_2,
      id_10,
      id_6,
      id_15,
      id_8,
      id_24,
      id_20,
      id_13,
      id_21,
      id_26,
      id_22,
      id_7,
      id_11
  );
  id_24(
      id_12, !id_11[-1], -1, -1
  );
  integer id_25;
  wire id_26;
  module_0 modCall_1 (
      id_22,
      id_9,
      id_2,
      id_20,
      id_21,
      id_13,
      id_11,
      id_19,
      id_25,
      id_25,
      id_6,
      id_25
  );
  assign id_15 = id_24;
  assign id_19 = 1;
  wire id_27;
  wire id_28, id_29;
  wire id_30 = id_13;
  assign id_4 = 1;
endmodule
