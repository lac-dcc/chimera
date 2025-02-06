// Seed: 1965546772
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
  output wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  tri id_15;
  \id_16 (
      id_5, -1
  );
  assign id_8 = $realtime;
  id_17(
      .id_0(id_9),
      .id_1(1),
      .id_2(id_11 & -1),
      .id_3(1),
      .id_4($realtime),
      .id_5($realtime),
      .id_6($realtime),
      .id_7(id_3),
      .id_8(),
      .id_9(id_15 == $realtime),
      .id_10(id_18 !== -1),
      .id_11(-1'b0),
      .id_12()
  );
  wire id_19;
  wire id_20;
  wire id_21;
  assign id_10 = \id_16 ;
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
    id_18
);
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_16 = id_16 << $realtime;
  wire id_19;
  supply0 id_20, id_21, id_22, id_23;
  id_24(
      .id_0(id_9), .id_1(id_15), .id_2(1'b0), .id_3($realtime), .id_4(-1)
  ); id_25(
      .id_0(id_23),
      .id_1($realtime == -1'd0),
      .id_2(),
      .id_3(id_4),
      .id_4(id_19),
      .id_5(-1),
      .id_6(-1),
      .id_7(id_15),
      .id_8($realtime),
      .id_9(),
      .id_10(id_22),
      .id_11($realtime & $realtime),
      .id_12(1 & 1),
      .id_13(),
      .id_14(id_8[-1]),
      .id_15(id_18),
      .id_16(id_19),
      .id_17(id_12[$realtime] & id_2),
      .id_18($realtime),
      .id_19(($realtime)),
      .id_20(id_17),
      .id_21(id_22),
      .id_22(id_14),
      .id_23(-1),
      .id_24(id_11),
      .id_25(id_21),
      .id_26(-1),
      .id_27($realtime),
      .id_28(id_22),
      .id_29(1'h0),
      .id_30(id_2),
      .id_31(id_1),
      .id_32(1),
      .id_33(($realtime ? 1 : $realtime))
  );
  module_0 modCall_1 (
      id_21,
      id_9,
      id_3,
      id_2,
      id_23,
      id_19,
      id_20,
      id_1,
      id_6,
      id_24,
      id_3,
      id_5,
      id_4,
      id_4
  );
  id_26(
      id_21, $realtime
  );
endmodule
