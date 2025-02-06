// Seed: 139088058
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
    id_18
);
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_19;
  wire id_20;
  id_21(
      .id_0(id_2),
      .id_1(!id_9),
      .id_2(id_3),
      .id_3(-1),
      .id_4(-1),
      .id_5(),
      .id_6(-1),
      .id_7(id_20),
      .id_8(-1),
      .id_9(1),
      .id_10($realtime),
      .id_11(-1),
      .id_12($realtime),
      .id_13($realtime),
      .id_14($realtime),
      .id_15(-1),
      .id_16(1)
  ); id_22(
      .id_0((id_14)), .id_1(1)
  );
endmodule
module module_1 #(
    parameter id_11 = 32'd79,
    parameter id_12 = 32'd8
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_8,
      id_9,
      id_9,
      id_6,
      id_10,
      id_6,
      id_8,
      id_10,
      id_8,
      id_3,
      id_6,
      id_9,
      id_9,
      id_6,
      id_8,
      id_3
  );
  defparam id_11.id_12 = id_7;
  assign id_11 = $realtime ? id_4 : id_4;
endmodule
