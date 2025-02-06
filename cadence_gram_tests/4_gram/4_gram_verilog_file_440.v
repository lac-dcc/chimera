// Seed: 1268840530
module module_0;
  logic [7:0] id_1;
  id_2(
      .id_0(-1),
      .id_1($realtime),
      .id_2(id_1[$realtime]),
      .id_3($realtime),
      .id_4($realtime),
      .id_5(-1),
      .id_6(),
      .id_7($realtime),
      .id_8($realtime),
      .id_9(id_1[$realtime]),
      .id_10(id_1[$realtime]),
      .id_11(id_3),
      .id_12(id_3),
      .id_13(-1),
      .id_14()
  );
  wire id_4;
  id_5(
      .id_0()
  );
  wire id_6;
  id_7(
      .id_0(1 & $realtime), .id_1(id_6)
  );
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 ();
  id_4(
      id_2, -1'b0, id_3, id_1
  );
  buf primCall (id_2, id_3);
  wire id_5;
endmodule
