// Seed: 3749913905
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
    id_20
);
  inout wire id_20;
  output wire id_19;
  output wire id_18;
  input wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_21;
  always_latch @(posedge id_20 or negedge 1) id_12 = 1'b0;
  wire id_22 = id_13;
  assign id_11[1] = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  wand id_3;
  assign id_1[1] = 1'b0;
  assign id_1[1] = id_1;
  id_4(
      .id_0(1), .id_1(1), .id_2(1), .id_3(1), .id_4(""), .id_5(1), .id_6(1), .id_7(id_3 & 1)
  );
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2
  );
endmodule
