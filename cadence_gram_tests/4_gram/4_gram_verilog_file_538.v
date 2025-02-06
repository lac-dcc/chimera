// Seed: 1002808608
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  output wire id_1;
  id_4(
      id_2, $realtime && -1'b0
  ); id_5(
      $realtime, id_1 * 1'b0 - $realtime
  );
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
    id_12
);
  input wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_13;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_10
  );
  assign modCall_1.id_1 = 0;
  assign id_1[1] = $realtime;
  tri1 id_14 = $realtime;
  id_15(
      .id_0($realtime),
      .id_1($realtime),
      .id_2(),
      .id_3(!id_3),
      .id_4(id_1),
      .id_5(1),
      .id_6(id_8),
      .id_7(~$realtime),
      .id_8($realtime),
      .id_9(id_11),
      .id_10(!id_4)
  );
  assign id_3 = id_11;
  id_16(
      .id_0($realtime), .id_1(id_7), .id_2($realtime), .id_3(id_11), .id_4(id_7), .id_5()
  );
  assign id_4 = 1;
  id_17(
      .id_0()
  );
  assign id_2 = -1'h0;
endmodule
