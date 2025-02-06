// Seed: 1013841793
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  id_8(
      !id_6, $realtime
  );
  tri id_9;
  assign id_4 = $realtime;
  id_10(
      .id_0(id_7),
      .id_1($realtime),
      .id_2(id_7),
      .id_3(-1),
      .id_4(id_6),
      .id_5($realtime),
      .id_6($realtime),
      .id_7(1),
      .id_8(-1),
      .id_9(1),
      .id_10(id_1),
      .id_11(-1),
      .id_12(1'b0),
      .id_13(id_1),
      .id_14(-1'h0),
      .id_15(id_9),
      .id_16(1),
      .id_17($realtime),
      .id_18(id_9 && id_2)
  );
  wire id_11;
  wire id_12;
  assign id_5 = id_5;
endmodule
module module_1 #(
    parameter id_17 = 32'd39,
    parameter id_18 = 32'd14
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
    id_12
);
  input wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_10 = id_2;
  xor primCall (id_6, id_14, id_12, id_11, id_3, id_13, id_9, id_2, id_1, id_8);
  wire id_13;
  parameter id_14 = $realtime;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_13,
      id_7,
      id_14,
      id_9,
      id_14
  );
  wire id_15;
  wire id_16;
  assign id_1 = id_8;
  defparam id_17.id_18 = 1'b0 && id_6[1];
endmodule
