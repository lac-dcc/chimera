// Seed: 495597992
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
    id_18
);
  output wire id_18;
  input wire id_17;
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  id_19(
      .id_0(id_16),
      .id_1({$realtime, $realtime} | $realtime | $realtime),
      .id_2($realtime),
      .id_3(),
      .id_4(id_10)
  );
  assign id_11 = $realtime;
  assign id_12 = id_1;
  logic [7:0] id_20, id_21, id_22, id_23, id_24, id_25, id_26, id_27, id_28, id_29;
  wire id_30;
  wire id_31;
  wire id_32;
  wire id_33;
  specify
    $width(negedge id_34 &&& 1, $realtime, id_21[-1]);
  endspecify
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_6,
      id_3,
      id_4,
      id_1,
      id_2,
      id_2,
      id_3,
      id_3,
      id_1,
      id_3,
      id_7,
      id_1,
      id_2,
      id_2,
      id_2,
      id_6
  );
  wire id_8;
  int  id_9;
endmodule
