// Seed: 3429382594
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
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23
);
  input wire id_23;
  input wire id_22;
  input wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_24;
  id_25(
      .id_0(id_4),
      .id_1(id_3),
      .id_2(id_17),
      .id_3(id_13 == id_15),
      .id_4(!id_21),
      .id_5(id_13),
      .id_6(id_13),
      .id_7(~id_11),
      .id_8(-1),
      .id_9(id_9),
      .id_10(),
      .id_11(),
      .id_12(id_16),
      .id_13(1'd0),
      .id_14(-1),
      .id_15(id_16)
  ); id_26(
      .id_0((id_4)),
      .id_1($realtime),
      .id_2(id_3),
      .id_3(),
      .id_4(id_24),
      .id_5(-1),
      .id_6(1'b0),
      .id_7(1),
      .id_8(-1),
      .id_9($realtime),
      .id_10($realtime),
      .id_11($realtime)
  );
  wand id_27 = 1'h0;
  wire id_28;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  tri0 id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2,
      id_1,
      id_1,
      id_3,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_2,
      id_3,
      id_2
  );
  specify
    if (-1) (negedge id_4 => (id_5  : $realtime)) = (id_2  : id_2  : id_4, id_3  : id_2  : id_5);
    (posedge id_6 => (id_7  : -1'b0)) = (id_7  : id_4  : -1, id_6  : $realtime : -1);
    $width(posedge id_8, id_3, $realtime);
  endspecify
endmodule
