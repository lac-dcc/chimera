// Seed: 636980697
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
    id_30,
    id_31,
    id_32,
    id_33,
    id_34,
    id_35,
    id_36,
    id_37,
    id_38,
    id_39,
    id_40
);
  input wire id_40;
  output wire id_39;
  inout wire id_38;
  input wire id_37;
  input wire id_36;
  input wire id_35;
  output wire id_34;
  inout wire id_33;
  input wire id_32;
  output reg id_31;
  output wire id_30;
  inout wire id_29;
  input wire id_28;
  inout wire id_27;
  inout wire id_26;
  inout wire id_25;
  inout wire id_24;
  input wire id_23;
  output wire id_22;
  inout wire id_21;
  input wire id_20;
  output wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(id_1) begin : LABEL_0
    fork
      repeat (id_35) $signed(92);
      ;
    join
  end
  wire [-1 : -1] id_41;
  initial begin : LABEL_1
    fork
      id_42;
      id_43(id_9 >= 1);
    join
    if (1'b0) id_31 = id_12;
    else assert (-1);
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout reg id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2,
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_1,
      id_3,
      id_3,
      id_1
  );
  always @(negedge id_3) begin : LABEL_0
    id_2 <= id_2;
  end
endmodule
