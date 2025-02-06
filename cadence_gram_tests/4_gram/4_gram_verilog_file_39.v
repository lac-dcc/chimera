// Seed: 1110695001
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_6;
  assign id_1 = -1 ? -1'b0 & id_5 : $realtime;
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
    id_10
);
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  id_11(
      .id_0($realtime), .id_1(-1'h0)
  );
  assign id_10 = -1;
  module_1(
      .id_0($realtime), .id_1(!id_2)
  );
  wire id_12;
  wire id_13;
  module_0 modCall_1 (
      id_12,
      id_5,
      id_6,
      id_3,
      id_12
  );
  \id_14 (
      .id_0()
  ); id_15(
      .id_0(id_7),
      .id_1(id_6),
      .id_2(1),
      .id_3($realtime),
      .id_4(1'b0),
      .id_5(id_8),
      .id_6($realtime),
      .id_7(id_7[1]),
      .id_8()
  ); id_16(
      .id_0(id_10)
  );
  wire id_17;
  wire id_18;
  wire #id_19 id_20;
  specify
    $width(posedge id_21, ($realtime), 1, id_22);
  endspecify
endmodule
