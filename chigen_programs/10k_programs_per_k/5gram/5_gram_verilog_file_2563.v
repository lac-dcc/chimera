// Seed: 2656262362
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  always @(id_2 or id_1 == 1)
    if (id_1) begin : LABEL_0
      deassign id_2;
    end else begin : LABEL_0
      id_1 = 1;
      id_2 <= 1;
    end
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
    id_34,
    id_35,
    id_36,
    id_37
);
  inout wire id_37;
  input wire id_36;
  output wire id_35;
  inout wire id_34;
  output wire id_33;
  input wire id_32;
  input wire id_31;
  output wire id_30;
  inout wire id_29;
  input wire id_28;
  inout wire id_27;
  input wire id_26;
  input wire id_25;
  input wire id_24;
  inout wire id_23;
  inout wire id_22;
  inout wire id_21;
  input wire id_20;
  input wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  reg id_38;
  integer id_39 = id_32, id_40 = id_11;
  module_0 modCall_1 (
      id_5,
      id_27
  );
  assign modCall_1.id_2 = 0;
  always @(negedge id_10) begin : LABEL_0
    id_38 <= 1'd0;
    assume (id_34 || id_27);
    if (id_39[1]) begin : LABEL_0
      id_2 = 1;
      id_27 <= 1'b0;
      if (id_7) id_9 <= 1;
    end
  end
endmodule
