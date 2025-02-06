// Seed: 1176882466
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  id_7(
      .id_0($realtime - $realtime), .id_1(id_1)
  );
  assign id_5 = 1'b0 ? $realtime : 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  id_7(
      .id_0($realtime), .id_1($realtime), .id_2(1)
  );
  wire id_8;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_6,
      id_8,
      id_5
  );
  wire id_9;
  id_10(
      $realtime, id_11[$realtime], id_2[-1&$realtime]
  );
  wire id_12;
  id_13(
      .id_0($realtime)
  ); id_14(
      .id_0(), .id_1()
  );
endmodule
