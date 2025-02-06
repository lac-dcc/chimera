// Seed: 1584205750
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
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4 = $realtime;
  assign id_4 = $realtime;
  tri0 id_9;
  id_10(
      .id_0(-1'b0),
      .id_1($realtime),
      .id_2(id_3),
      .id_3(id_1),
      .id_4(id_8),
      .id_5($realtime),
      .id_6((id_3)),
      .id_7($realtime),
      .id_8()
  );
  wire id_11;
  wire id_12;
  assign id_6 = id_10;
  id_13(
      id_4, id_1, $realtime
  );
  assign id_9 = -1 ? 1 : 1;
  id_14(
      .id_0(), .id_1($realtime), .id_2(~id_3)
  );
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  id_7(
      $realtime, -1, $realtime, id_2
  );
  wire id_8;
  wire id_9;
  parameter id_10 = id_3;
  `define pp_11 0
  wire id_12;
  nor primCall (id_2, id_12, id_4, id_10, id_5, id_13);
  wire id_13;
  module_0 modCall_1 (
      id_12,
      id_4,
      id_8,
      id_5,
      id_6,
      id_7,
      id_5,
      id_9
  );
endmodule
