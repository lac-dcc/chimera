// Seed: 400767110
module module_0 (
    id_1,
    id_2,
    id_3,
    access,
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
    module_0,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30
);
  input wire id_30;
  input wire id_29;
  inout wire id_28;
  inout wire id_27;
  input wire id_26;
  input wire id_25;
  output wire id_24;
  output wire id_23;
  output wire id_22;
  inout wire id_21;
  input wire id_20;
  inout wire id_19;
  inout wire id_18;
  input wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_31;
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd50,
    parameter id_5 = 32'd30
) (
    output wire id_0,
    input uwire _id_1,
    input supply0 id_2,
    input tri id_3,
    input wor id_4,
    input supply1 _id_5,
    input tri1 id_6,
    output logic id_7,
    output wor id_8
);
  logic [1 : id_5  ==  id_1] id_10;
  assign id_7 = id_10 ? -1'b0 : ~id_6;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10
  );
  parameter id_11 = -1;
  initial
  fork : SymbolIdentifier
  join_any : SymbolIdentifier
  always disable id_12;
  assign id_8 = id_11;
  logic [-1 : 1] id_13;
  ;
  always_latch
    if (-1) begin : LABEL_0
      id_7 <= id_4;
    end
endmodule
