// Seed: 1531056943
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
  inout wire id_22;
  input wire id_21;
  input wire id_20;
  input wire id_19;
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  parameter id_24 = 1'b0;
  wire id_25;
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
    id_29,
    id_30,
    id_31,
    id_32,
    id_33,
    id_34
);
  inout wire id_34;
  inout wire id_33;
  inout wire id_32;
  output wire id_31;
  output wire id_30;
  output wire id_29;
  output wire id_28;
  inout wire id_27;
  input wire id_26;
  inout wire id_25;
  inout wire id_24;
  inout wire id_23;
  output wire id_22;
  inout wire id_21;
  inout wire id_20;
  input wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire \id_35 ;
  id_36(
      -1'b0, $realtime, 1
  );
  module_0 modCall_1 (
      id_34,
      id_23,
      \id_35 ,
      id_25,
      id_20,
      id_19,
      id_4,
      id_33,
      id_11,
      id_21,
      id_1,
      \id_35 ,
      id_3,
      id_12,
      id_21,
      id_1,
      id_10,
      id_10,
      id_3,
      id_23,
      id_13,
      id_24,
      id_21
  );
  id_37(
      .id_0(1), .id_1($realtime), .id_2(1)
  );
  always @(id_34 or negedge id_24) begin : LABEL_0
    id_18[$realtime : $realtime] <= 1;
    id_14 <= -1;
    id_5 <= id_32;
    id_27 <= -1;
  end
  assign id_30 = $realtime;
  wire id_38;
  id_39(
      .id_0(1), .id_1()
  );
endmodule
