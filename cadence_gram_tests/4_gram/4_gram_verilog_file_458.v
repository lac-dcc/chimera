// Seed: 2692017355
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  assign id_1 = id_3;
  id_4(
      .id_0(id_3[$realtime]), .id_1($realtime)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_5(
      .id_0(id_2[$realtime : 1]),
      .id_1($realtime && id_4 && 1'b0 && -1),
      .id_2(1'b0),
      .id_3($realtime),
      .id_4(-1),
      .id_5($realtime),
      .id_6($realtime),
      .id_7(-1'b0),
      .id_8(id_2[1 : $realtime])
  ); id_6(
      .id_0()
  );
  assign id_3 = $realtime;
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_1
  );
endmodule
