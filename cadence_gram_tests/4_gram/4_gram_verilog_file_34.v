// Seed: 3570548607
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
    id_19
);
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_20;
  wire id_21;
  assign id_2 = 1;
  assign id_4 = id_17;
  id_22(
      .id_0(1), .id_1(-1), .id_2(1), .id_3($realtime)
  );
  wire id_23;
  wire id_24;
  wire id_25;
  wire id_26;
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
    id_11
);
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_12;
  assign id_3 = id_1;
  wire id_13;
  module_0 modCall_1 (
      id_12,
      id_5,
      id_8,
      id_5,
      id_12,
      id_13,
      id_7,
      id_13,
      id_12,
      id_5,
      id_10,
      id_1,
      id_2,
      id_5,
      id_5,
      id_13,
      id_7,
      id_9,
      id_7
  );
  id_14(
      .id_0(id_7), .id_1(id_11), .id_2({id_11{id_5}}), .id_3(1'b0)
  );
  wire id_15;
  wire id_16;
  wire id_17 = id_12;
endmodule
