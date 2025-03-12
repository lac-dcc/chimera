// Seed: 1609638357
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6#(.id_7(1))
);
  input logic [7:0] id_6;
  assign module_1.id_24 = 0;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_8;
  ;
  wire id_9;
  bit  id_10;
  wire id_11;
  ;
  always @(-1) begin : LABEL_0
    if (1) id_10 = id_1.id_4 && 1;
  end
  assign {id_10, id_11} = -1 + 1 | id_6[-1'd0];
endmodule
module module_1 #(
    parameter id_11 = 32'd3,
    parameter id_18 = 32'd0,
    parameter id_27 = 32'd20,
    parameter id_34 = 32'd0
) (
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
    _id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17[1 :-1],
    _id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    _id_27,
    id_28,
    id_29,
    id_30,
    id_31,
    id_32[id_18 : 1'b0],
    id_33[id_27 : 1],
    _id_34,
    id_35,
    id_36,
    id_37,
    id_38,
    id_39,
    id_40[-1 : id_34==id_11]
);
  output logic [7:0] id_40;
  input wire id_39;
  input wire id_38;
  output wire id_37;
  input wire id_36;
  input wire id_35;
  inout wire _id_34;
  inout logic [7:0] id_33;
  input logic [7:0] id_32;
  input wire id_31;
  input wire id_30;
  inout wire id_29;
  inout wire id_28;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_5,
      id_29,
      id_23,
      id_33
  );
  inout wire _id_27;
  inout logic [7:0] id_26;
  input wire id_25;
  inout reg id_24;
  output wire id_23;
  inout wire id_22;
  input wire id_21;
  output wire id_20;
  inout wire id_19;
  output wire _id_18;
  output logic [7:0] id_17;
  inout wire id_16;
  output wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire _id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  initial id_24 <= (id_6);
  assign id_24 = id_26[1];
endmodule
