// Seed: 1836042901
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  assign module_1.id_29 = 0;
  output wire id_1;
  parameter id_5 = "";
endmodule
module module_1 #(
    parameter id_1  = 32'd40,
    parameter id_11 = 32'd96,
    parameter id_12 = 32'd59,
    parameter id_15 = 32'd36,
    parameter id_20 = 32'd58,
    parameter id_21 = 32'd10,
    parameter id_4  = 32'd28
) (
    _id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    _id_11,
    _id_12,
    id_13,
    id_14,
    _id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    _id_20,
    _id_21
);
  inout wire _id_21;
  input wire _id_20;
  output wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire _id_15;
  input wire id_14;
  input wire id_13;
  inout wire _id_12;
  inout wire _id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire _id_4;
  input wire id_3;
  output wire id_2;
  input wire _id_1;
  assign id_18 = -1'b0;
  assign id_10 = id_5;
  wire id_22;
  ;
  supply0 [id_1 : id_21] id_23;
  assign id_23 = id_9 == id_15;
  logic [-1 : id_15] id_24 = id_15, id_25;
  xnor primCall (
      id_8, id_24, id_16, id_13, id_23, id_28, id_26, id_17, id_22, id_14, id_9, id_5, id_27, id_29
  );
  wire [id_11 : 1 'b0] id_26;
  wire [id_1 : 1] id_27;
  wire [id_4  !==  id_20 : -1] id_28;
  logic [id_4 : id_12] id_29 = -1;
  module_0 modCall_1 (
      id_26,
      id_22,
      id_26,
      id_25
  );
endmodule
