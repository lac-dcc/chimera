// Seed: 1039184372
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
    id_29
);
  output wire id_29;
  output wire id_28;
  input wire id_27;
  input wire id_26;
  input wire id_25;
  inout wire id_24;
  input wire id_23;
  inout wire id_22;
  input wire id_21;
  input wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_10 = id_24;
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
  inout wire id_30;
  input wire id_29;
  inout wire id_28;
  output wire id_27;
  output wire id_26;
  inout wire id_25;
  input wire id_24;
  input wire id_23;
  inout wire id_22;
  input wire id_21;
  inout wire id_20;
  output wire id_19;
  input wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_31;
  module_0 modCall_1 (
      id_15,
      id_10,
      id_5,
      id_28,
      id_2,
      id_23,
      id_3,
      id_22,
      id_3,
      id_1,
      id_26,
      id_22,
      id_22,
      id_28,
      id_18,
      id_27,
      id_31,
      id_4,
      id_3,
      id_1,
      id_15,
      id_31,
      id_15,
      id_15,
      id_1,
      id_31,
      id_30,
      id_28,
      id_3
  );
  wire id_32;
  xnor primCall (
      id_3,
      id_20,
      id_28,
      id_18,
      id_8,
      id_25,
      id_24,
      id_31,
      id_22,
      id_11,
      id_15,
      id_5,
      id_1,
      id_30,
      id_10,
      id_23,
      id_14,
      id_29
  );
  always @($realtime / id_11 or posedge $realtime or negedge id_24) begin : LABEL_0
    id_12 <= #1 id_20[-1];
  end
  logic [7:0] id_33;
  id_34(
      .id_0($realtime), .id_1(id_33[-1]), .id_2((1))
  );
  assign id_16 = $realtime;
endmodule
