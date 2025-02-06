// Seed: 3210985986
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
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  id_15(
      .id_0(id_14),
      .id_1($realtime),
      .id_2($realtime),
      .id_3(-1),
      .id_4(id_13),
      .id_5(id_14),
      .id_6()
  );
  wire id_16, id_17, id_18, id_19, id_20, id_21;
  wire id_22;
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
    id_27,
    id_28,
    id_29
);
  output wire id_29;
  output wire id_28;
  output wire id_27;
  inout wire id_26;
  input wire id_25;
  input wire id_24;
  output wire id_23;
  output wire id_22;
  inout wire id_21;
  inout wire id_20;
  input wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  id_30(
      .id_0({$realtime, $realtime, id_19}),
      .id_1(1),
      .id_2(-1),
      .id_3(id_5[-1]),
      .id_4(id_8),
      .id_5(),
      .id_6($realtime),
      .id_7(id_7),
      .id_8($realtime),
      .id_9(id_22),
      .id_10(id_4[1]),
      .id_11(1),
      .id_12($realtime),
      .id_13(1),
      .id_14($realtime),
      .id_15($realtime),
      .id_16(),
      .id_17($realtime),
      .id_18($realtime),
      .id_19(id_24)
  );
  wand id_31;
  wire id_32;
  module_0 modCall_1 (
      id_6,
      id_24,
      id_11,
      id_6,
      id_2,
      id_9,
      id_21,
      id_2,
      id_7,
      id_13,
      id_26,
      id_26,
      id_26,
      id_7
  );
  specify
    if  ( $realtime )  (  negedge  id_33  =>  (  id_34  :  (  1 'b0 )  )  )  =  (  id_19  :  id_11  : $realtime ,  id_19  :  -1  : $realtime )  ;
    (negedge id_35 => (id_36  : -1)) = (id_15[$realtime] : id_31  : id_11,
                                        id_35  : $realtime : 1'b0);
    (negedge id_37 => (id_38 +: $realtime)) = (id_6  : $realtime : !id_7, id_36  : -1  : id_9);
  endspecify
endmodule
