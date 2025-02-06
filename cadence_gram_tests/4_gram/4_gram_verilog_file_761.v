// Seed: 2957496626
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5;
  wire id_6;
  assign id_3 = $realtime;
  wire id_7, id_8, id_9;
  wire id_10;
  wire id_11;
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
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_8;
  wire id_9;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_9
  );
  wor id_10;
  id_11(
      .id_0(id_9),
      .id_1(id_1),
      .id_2(),
      .id_3(),
      .id_4(1),
      .id_5(1'h0),
      .id_6(),
      .id_7($realtime),
      .id_8(),
      .id_9(id_2),
      .id_10()
  );
  wire id_12;
  wire id_13;
  id_14(
      .id_0((id_9)),
      .id_1(-1),
      .id_2($realtime),
      .id_3(~id_7),
      .id_4($realtime),
      .id_5(-1'b0),
      .id_6($realtime),
      .id_7(1),
      .id_8(),
      .id_9(-1),
      .id_10(1),
      .id_11(),
      .id_12(1'b0),
      .id_13($realtime),
      .id_14($realtime && id_10),
      .id_15()
  );
endmodule
