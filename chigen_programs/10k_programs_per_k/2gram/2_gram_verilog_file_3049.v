// Seed: 1056193168
module module_0 (
    id_1
);
  inout logic [7:0] id_1;
  genvar id_2;
  assign id_1[1] = 1;
endmodule
module module_1 #(
    parameter id_23 = 32'd34,
    parameter id_41 = 32'd32,
    parameter id_42 = 32'd90,
    parameter id_43 = 32'd50,
    parameter id_45 = 32'd93,
    parameter id_49 = 32'd33
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
    _id_23,
    id_24,
    id_25
);
  input wire id_25;
  output wire id_24;
  input wire _id_23;
  output wire id_22;
  input wire id_21;
  output wire id_20;
  input wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  inout logic [7:0] id_15;
  module_0 modCall_1 (id_15);
  output wire id_14;
  output logic [7:0] id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout reg id_7;
  input wire id_6;
  inout wand id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output supply0 id_1;
  assign id_13[1'b0 : 1'b0] = id_9;
  assign id_15 = id_21;
  assign id_7 = {-1 & id_4{-1}};
  assign id_15[-1 : 1&&1'h0] = id_6;
  assign id_5 = 1;
  wire id_26;
  assign id_20 = -1'b0 == (id_17);
  nand primCall (
      id_20,
      id_7,
      id_15,
      id_6,
      id_3,
      id_11,
      id_5,
      id_17,
      id_4,
      id_12,
      id_19,
      id_21,
      id_16,
      id_9,
      id_25
  );
  logic [-1 : 1 'b0] id_27[id_23 : 1] = id_12;
  assign id_7 = -1;
  localparam id_28 = 1;
  logic [7:0]
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
      _id_41,
      _id_42,
      _id_43,
      id_44,
      _id_45,
      id_46,
      id_47,
      id_48,
      _id_49;
  assign id_1 = 1'b0;
  assign id_37[-1] = (1);
  logic [{  id_42  ,  id_43  ,  id_45  ,  1 'b0 } : id_41] id_50;
  logic [7:0] id_51, id_52;
  assign id_52[1-:id_49&-1] = id_17 + -1;
  always_comb begin : LABEL_0
    id_7 = id_29;
  end
endmodule
