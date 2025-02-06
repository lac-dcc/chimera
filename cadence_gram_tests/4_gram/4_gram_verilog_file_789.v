// Seed: 1476965497
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
    id_14
);
  output wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  id_15(
      .id_0((id_12)),
      .id_1(id_7[-1'b0]),
      .id_2(!id_5),
      .id_3(id_12),
      .id_4($realtime),
      .id_5(),
      .id_6(1),
      .id_7($realtime)
  );
  assign id_8 = id_5;
  wire id_16;
  id_17(
      -1, $realtime
  );
  tri0 id_18 = 1;
  wire id_19;
  assign id_2 = id_3;
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
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  output wire id_20;
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_21(
      .id_0(id_20), .id_1(id_22)
  );
  wire id_23;
  logic [7:0] id_24;
  module_0 modCall_1 (
      id_1,
      id_11,
      id_2,
      id_11,
      id_11,
      id_1,
      id_24,
      id_2,
      id_2,
      id_9,
      id_24,
      id_23,
      id_19,
      id_15
  );
  id_25(
      .id_0($realtime), .id_1()
  );
  wire \id_26 ;
  wire id_27;
  supply1 id_28 = id_11 & id_14;
  id_29(
      .id_0(1),
      .id_1(id_11),
      .id_2(1),
      .id_3(1'b0),
      .id_4(1),
      .id_5(-1 && $realtime),
      .id_6(-1'h0 && -1'b0),
      .id_7(\id_26 ),
      .id_8(id_22)
  ); specify
    $width(posedge id_30, 1, id_24[$realtime], id_31);
  endspecify
endmodule
