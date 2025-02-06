// Seed: 3899176008
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
    id_37
);
  inout wire id_37;
  inout wire id_36;
  output wire id_35;
  inout wire id_34;
  output wire id_33;
  output wire id_32;
  output wire id_31;
  output wire id_30;
  input wire id_29;
  input wire id_28;
  inout wire id_27;
  input wire id_26;
  output wire id_25;
  output wire id_24;
  input wire id_23;
  input wire id_22;
  input wire id_21;
  inout wire id_20;
  output wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_18 = $realtime;
  wire id_38;
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
    id_19
);
  output wire id_19;
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_20;
  module_0 modCall_1 (
      id_20,
      id_10,
      id_20,
      id_4,
      id_6,
      id_6,
      id_13,
      id_9,
      id_20,
      id_16,
      id_13,
      id_5,
      id_11,
      id_13,
      id_10,
      id_11,
      id_20,
      id_13,
      id_11,
      id_10,
      id_10,
      id_5,
      id_6,
      id_20,
      id_20,
      id_20,
      id_13,
      id_9,
      id_20,
      id_13,
      id_16,
      id_10,
      id_20,
      id_13,
      id_11,
      id_20,
      id_13
  );
  assign id_1 = id_16;
  id_21(
      .id_0()
  );
  always @(id_10 or negedge ~1) begin : LABEL_0
    if (-1) begin : LABEL_0
      id_13 = id_9;
    end else id_3 <= 1'b0 & (id_7);
    if (id_6) if (id_9) id_11 = id_16;
  end
endmodule
