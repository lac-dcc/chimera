// Seed: 3321676049
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
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30
);
  output wire id_30;
  output wire id_29;
  output wire id_28;
  input wire id_27;
  inout wire id_26;
  inout wire id_25;
  output wire id_24;
  output wire id_23;
  inout wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  id_31(
      .id_0($realtime), .id_1($realtime)
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
  input wire id_34;
  inout wire id_33;
  output wire id_32;
  output wire id_31;
  inout wire id_30;
  output wire id_29;
  input wire id_28;
  output wire id_27;
  output wire id_26;
  input wire id_25;
  inout wire id_24;
  output wire id_23;
  inout wire id_22;
  input wire id_21;
  input wire id_20;
  output wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_35;
  logic [7:0] id_36;
  logic [7:0] id_37;
  always @($realtime or $realtime) begin : LABEL_0
    id_10 <= $realtime;
    if (~id_8) begin : LABEL_0
      id_9 <= id_36[$realtime];
      id_18[-1] = id_21;
    end
  end
  wire id_38;
  assign id_36 = id_37;
  assign id_30 = $realtime;
  id_39(
      id_11[(1)&$realtime], id_17, -1
  );
  module_0 modCall_1 (
      id_17,
      id_17,
      id_32,
      id_22,
      id_30,
      id_14,
      id_8,
      id_33,
      id_24,
      id_16,
      id_24,
      id_33,
      id_38,
      id_25,
      id_22,
      id_3,
      id_27,
      id_25,
      id_30,
      id_30,
      id_1,
      id_3,
      id_16,
      id_33,
      id_16,
      id_17,
      id_24,
      id_19,
      id_15,
      id_15
  );
endmodule
