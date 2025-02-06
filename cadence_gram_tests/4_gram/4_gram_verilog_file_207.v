// Seed: 2110763131
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
    id_10
);
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_11;
  assign id_7 = $realtime;
  assign module_1.id_11 = 0;
  supply1 id_12 = 1;
endmodule
module module_1 #(
    parameter id_15 = 32'd70,
    parameter id_16 = 32'd96
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  defparam id_15.id_16 = id_10;
  wire id_17;
  always @(posedge -1 or posedge -1) id_11 <= id_14;
  assign id_6 = -1'b0;
  id_18(
      .id_0(1'b0),
      .id_1(),
      .id_2($realtime),
      .id_3(),
      .id_4(id_6),
      .id_5(1),
      .id_6(1),
      .id_7($realtime),
      .id_8($realtime),
      .id_9(id_7[1]),
      .id_10($realtime),
      .id_11($realtime),
      .id_12(-1),
      .id_13(),
      .id_14(id_17),
      .id_15(!id_8),
      .id_16(),
      .id_17(id_8)
  );
  module_0 modCall_1 (
      id_4,
      id_17,
      id_4,
      id_2,
      id_2,
      id_3,
      id_4,
      id_5,
      id_2,
      id_5
  );
  assign id_11 = ~id_1;
endmodule
