// Seed: 2526047141
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
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
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
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27
);
  input wire id_27;
  inout wire id_26;
  input wire id_25;
  input wire id_24;
  input wire id_23;
  output wire id_22;
  output wire id_21;
  input wire id_20;
  input wire id_19;
  inout wire id_18;
  input wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  tri0 id_28;
  module_0 modCall_1 (
      id_3,
      id_26,
      id_26,
      id_19,
      id_12,
      id_4,
      id_3,
      id_24,
      id_28,
      id_26,
      id_18,
      id_15,
      id_3,
      id_26
  );
  logic [7:0] id_29;
  assign id_2 = id_6;
  tri id_30;
  id_31(
      ($realtime == id_25), $realtime
  );
  supply1 id_32;
  assign id_29   = id_27;
  assign id_1[1] = -1 ? 1'b0 : 1'b0;
  id_33(
      .id_0($realtime),
      .id_1(-1),
      .id_2((id_14)),
      .id_3(-1'b0),
      .id_4(-1),
      .id_5(),
      .id_6(id_4),
      .id_7(1'd0),
      .id_8(id_15),
      .id_9(),
      .id_10(1),
      .id_11(id_17),
      .id_12(id_16),
      .id_13($realtime),
      .id_14($realtime),
      .id_15($realtime),
      .id_16(),
      .id_17(id_27[$realtime]),
      .id_18(id_2),
      .id_19(id_26),
      .id_20($realtime),
      .id_21(1),
      .id_22(id_5),
      .id_23()
  ); id_34(
      .id_0(1),
      .id_1($realtime),
      .id_2($realtime),
      .id_3($realtime),
      .id_4(id_31),
      .id_5($realtime & $realtime & id_20 & id_23[$realtime][$realtime]),
      .id_6($realtime),
      .id_7()
  );
  assign id_26 = !$realtime;
  id_35(
      .id_0($realtime), .id_1(1'd0), .id_2(1'd0), .id_3()
  ); specify
    $setuphold(negedge id_36, posedge id_37, $realtime, id_26);
    (id_38 + => id_39) = (id_28  : !id_15  : $realtime && -1'b0, id_9  : id_32  : $realtime);
    (  negedge  id_40  =>  (  id_41  :  -1 'b0 )  )  =  (  1  + $realtime >  -1  :  1  :  !  id_7  ,  id_30  : $realtime :  id_32  )  ;
  endspecify
endmodule
