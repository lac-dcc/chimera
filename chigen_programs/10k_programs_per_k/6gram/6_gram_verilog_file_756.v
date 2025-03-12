// Seed: 3146161473
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout supply1 id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_10;
  wire id_11, id_12, id_13, id_14, id_15;
  parameter id_16 = -1'd0;
  wire id_17;
  wire id_18, id_19;
  wire id_20;
  wire id_21;
  bit
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
      id_39;
  logic id_40 = -1;
  always @(id_17 or -1)
    for (id_9 = 1'h0; 1; id_27 = 1'h0 ^ id_9) begin : LABEL_0
      if (-1) begin : LABEL_1
        disable id_41;
      end
      wait (1);
    end
  wire id_42;
  ;
endmodule
module module_1 #(
    parameter id_7 = 32'd36
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
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
  inout wire id_29;
  inout wire id_28;
  output wire id_27;
  module_0 modCall_1 (
      id_8,
      id_21,
      id_17,
      id_19,
      id_5,
      id_22,
      id_29,
      id_14,
      id_28
  );
  assign modCall_1.id_36 = 0;
  output logic [7:0] id_26;
  input wire id_25;
  output wire id_24;
  output wire id_23;
  output wire id_22;
  input wire id_21;
  input wire id_20;
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire _id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_27 = id_10;
  assign id_26[id_7] = -1;
  wire  id_30;
  logic id_31;
  ;
endmodule
