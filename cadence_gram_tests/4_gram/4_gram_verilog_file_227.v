// Seed: 4161402130
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_9;
  wire id_10;
  id_11(
      .id_0($realtime), .id_1()
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_3,
      id_6,
      id_1,
      id_2,
      id_2
  );
  assign id_2 = id_7;
  wire id_8;
  id_9(
      .id_0(-1'b0),
      .id_1(1),
      .id_2($realtime),
      .id_3(id_6),
      .id_4(id_4),
      .id_5($realtime),
      .id_6(1),
      .id_7(id_4),
      .id_8($realtime),
      .id_9($realtime),
      .id_10()
  );
  wire id_10;
  assign id_7 = -1 ? $realtime : id_1 && $realtime;
endmodule
