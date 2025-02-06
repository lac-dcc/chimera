// Seed: 889290524
module module_0 (
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
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wor id_16;
  assign id_2 = id_16;
  assign id_5 = 1;
  always @(posedge id_16 or negedge $realtime) begin : LABEL_0
    id_1 = id_11;
  end
  id_17(
      id_3, -1, id_2, id_2, 1
  );
  wire id_18;
  id_19(
      .id_0($realtime), .id_1(id_15), .id_2(id_10)
  ); id_20(
      .id_0(-1), .id_1(id_15), .id_2(id_8[1'b0])
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
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  id_16(
      .id_0(id_13),
      .id_1(id_3),
      .id_2($realtime == -1'b0),
      .id_3(id_2),
      .id_4(id_7[1] && 1),
      .id_5($realtime),
      .id_6($realtime),
      .id_7(),
      .id_8($realtime),
      .id_9($realtime),
      .id_10(id_5)
  );
  assign id_7[1'b0] = id_14;
  supply1 id_17;
  module_0 modCall_1 (
      id_4,
      id_12,
      id_3,
      id_17,
      id_10,
      id_5,
      id_14,
      id_7,
      id_17,
      id_17,
      id_9,
      id_9,
      id_11,
      id_1,
      id_10
  );
  assign id_4  = $realtime;
  assign id_10 = 1 ? -1 : -1'b0;
  id_18(
      .id_0(-1),
      .id_1(id_6 == id_14 | -1),
      .id_2($realtime),
      .id_3(id_7),
      .id_4($realtime),
      .id_5(id_17),
      .id_6(id_3),
      .id_7(id_2)
  ); id_19(
      id_17, 1
  );
endmodule
