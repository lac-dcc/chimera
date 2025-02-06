// Seed: 3967329379
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 (
    output wor id_0,
    input wor id_1,
    output wand id_2,
    output supply0 id_3,
    input supply0 id_4,
    output tri1 id_5,
    input supply0 id_6,
    input wire id_7,
    output wire id_8,
    output uwire id_9,
    output tri id_10,
    input supply0 id_11
    , id_13
);
  assign id_0 = $realtime ? !id_7 : id_4;
  xnor primCall (id_2, id_14, id_4, id_16, id_11, id_18, id_1, id_7, id_17, id_13, id_6, id_15);
  assign id_5 = id_13 ? 1 : id_4;
  wire id_14;
  wire id_15;
  wire id_16;
  nmos id_17 ($realtime, $realtime, $realtime);
  logic [7:0] id_18;
  module_0 modCall_1 (
      id_16,
      id_16,
      id_15,
      id_15,
      id_14
  );
  id_19(
      .id_0(1),
      .id_1($realtime),
      .id_2(id_11#(.id_3(~$realtime)) && id_0 && id_1 && 1),
      .id_4(1),
      .id_5(-1),
      .id_6(-1),
      .id_7(id_14),
      .id_8($realtime),
      .id_9(-1),
      .id_10($realtime),
      .id_11(),
      .id_12($realtime),
      .id_13(id_17),
      .id_14(-1),
      .id_15(1),
      .id_16(id_18[1]),
      .id_17($realtime)
  ); id_20(
      .id_0(1'b0), .id_1(id_11), .id_2($realtime), .id_3()
  );
endmodule
