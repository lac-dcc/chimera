// Seed: 1512302030
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
  input wire id_20;
  output wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4 = -1, id_11 = -1;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input tri id_0,
    input supply0 id_1,
    output supply1 id_2,
    output tri id_3,
    input uwire id_4,
    input wor id_5,
    input wand id_6,
    input supply1 id_7,
    output logic id_8
);
  id_10(
      .id_0(-1), .id_1(-1)
  );
  assign id_3 = -1;
  assign id_2 = (id_5 ^ 1);
  always_latch
    if (~id_5) id_8 <= -1;
    else id_3 = id_7;
  wire id_11;
  assign id_8 = 1;
  wire id_12;
  supply0 id_13, id_14;
  wire id_15;
  parameter id_16 = id_13 ? 1 : -1'd0;
  module_0 modCall_1 (
      id_15,
      id_12,
      id_14,
      id_13,
      id_13,
      id_16,
      id_11,
      id_12,
      id_14,
      id_15,
      id_12,
      id_14,
      id_13,
      id_11,
      id_16,
      id_11,
      id_12,
      id_13,
      id_13,
      id_12,
      id_14
  );
endmodule
