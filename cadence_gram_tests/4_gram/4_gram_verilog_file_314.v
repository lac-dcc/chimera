// Seed: 4222047377
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
  output wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_13[$realtime] = $realtime;
  wire id_22;
  assign id_7[$realtime] = id_16;
  wire id_23;
  wire id_24;
  assign module_1.id_7 = 0;
  wire id_25;
  assign id_1 = id_17;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  id_9(
      .id_0(1), .id_1($realtime), .id_2(id_2[-1'b0]), .id_3(id_8), .id_4(id_3)
  );
  module_0 modCall_1 (
      id_7,
      id_3,
      id_1,
      id_3,
      id_5,
      id_5,
      id_4,
      id_7,
      id_7,
      id_1,
      id_7,
      id_1,
      id_4,
      id_7,
      id_3,
      id_7,
      id_3,
      id_7,
      id_6,
      id_7,
      id_7
  );
  id_10(
      .id_0(id_4[-1]),
      .id_1(id_1),
      .id_2(id_8),
      .id_3(id_4),
      .id_4((-1 ? 1 : $realtime)),
      .id_5(id_6),
      .id_6(),
      .id_7(id_3),
      .id_8(id_1),
      .id_9(id_1),
      .id_10($realtime),
      .id_11(1),
      .id_12(id_9)
  );
  assign id_6 = $realtime;
  assign id_7 = -1;
  wire id_11, id_12, id_13;
endmodule
