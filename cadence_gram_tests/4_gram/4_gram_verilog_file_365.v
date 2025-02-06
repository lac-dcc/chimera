// Seed: 397055856
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_15 = 32'd81,
    parameter id_16 = 32'd99
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  logic [7:0] id_8;
  id_9(
      .id_0($realtime), .id_1(id_1), .id_2(id_7), .id_3(), .id_4(id_5[-1'b0]), .id_5($realtime)
  );
  module_0 modCall_1 (
      id_6,
      id_2,
      id_2,
      id_2,
      id_6,
      id_6,
      id_6
  );
  wire id_10;
  tri1 id_11;
  parameter id_12 = -1 == $realtime || id_11;
  wire id_13;
  wire id_14;
  defparam id_15.id_16 = -1; id_17(
      .id_0(-1),
      .id_1(id_3),
      .id_2($realtime),
      .id_3(id_8[$realtime]),
      .id_4(id_6),
      .id_5($realtime),
      .id_6($realtime),
      .id_7($realtime),
      .id_8(id_5[$realtime]),
      .id_9($realtime),
      .id_10(~id_11),
      .id_11(id_12),
      .id_12(1),
      .id_13($realtime)
  ); timeprecision 1ps;
  supply0 id_18 = -1;
endmodule
