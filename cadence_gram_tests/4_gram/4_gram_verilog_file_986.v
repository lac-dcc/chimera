// Seed: 3590723946
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
    id_40,
    id_41,
    id_42,
    id_43
);
  input wire id_43;
  input wire id_42;
  inout wire id_41;
  input wire id_40;
  output wire id_39;
  input wire id_38;
  inout wire id_37;
  inout wire id_36;
  inout wire id_35;
  input wire id_34;
  inout wire id_33;
  output wire id_32;
  output wire id_31;
  inout wire id_30;
  output wire id_29;
  inout wire id_28;
  output wire id_27;
  output wire id_26;
  inout wire id_25;
  output wire id_24;
  inout wire id_23;
  inout wire id_22;
  input wire id_21;
  inout wire id_20;
  inout wire id_19;
  input wire id_18;
  input wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_44;
  id_45(
      .id_0(id_5), .id_1(-1'd0)
  );
  assign id_32 = id_25;
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
    id_30
);
  output wire id_30;
  input wire id_29;
  output wire id_28;
  input wire id_27;
  output wire id_26;
  output wire id_25;
  input wire id_24;
  inout wire id_23;
  inout wire id_22;
  input wire id_21;
  output wire id_20;
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge id_3 or negedge 1'b0)
    if (id_1[$realtime]) begin : LABEL_0
      id_12 <= id_23;
    end else begin : LABEL_0
      id_26 <= -1;
    end
  id_31(
      $realtime, id_3, $realtime <= 1
  );
  module_0 modCall_1 (
      id_6,
      id_10,
      id_5,
      id_28,
      id_11,
      id_5,
      id_11,
      id_29,
      id_6,
      id_17,
      id_21,
      id_22,
      id_22,
      id_28,
      id_17,
      id_13,
      id_24,
      id_4,
      id_3,
      id_13,
      id_19,
      id_11,
      id_7,
      id_15,
      id_13,
      id_11,
      id_30,
      id_6,
      id_3,
      id_11,
      id_13,
      id_11,
      id_2,
      id_18,
      id_19,
      id_17,
      id_10,
      id_17,
      id_5,
      id_17,
      id_13,
      id_7,
      id_21
  );
  wire id_32;
  nand primCall (
      id_12,
      id_22,
      id_2,
      id_10,
      id_29,
      id_23,
      id_27,
      id_9,
      id_6,
      id_31,
      id_4,
      id_18,
      id_16,
      id_3,
      id_19,
      id_13,
      id_7,
      id_5,
      id_17,
      id_24,
      id_11
  );
endmodule
