// Seed: 453628235
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
    id_21
);
  inout wire id_21;
  input wire id_20;
  inout wire id_19;
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  bit id_22;
  wire id_23, id_24;
  localparam  id_25  =  1  ,  id_26  =  id_19  ,  id_27  =  1  ,  id_28  =  id_5  ,  id_29  =  1  ?  id_16  :  id_12  ,  id_30  =  id_2  ,  id_31  =  id_31  ,  id_32  =  1  ;
  assign id_1 = id_21;
  logic id_33;
  always @(!id_4 or negedge -1'b0) id_22 <= id_29 == id_25;
endmodule
module module_1 #(
    parameter id_4 = 32'd76
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  input wire id_5;
  input wire _id_4;
  output wire id_3;
  output wire id_2;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_5,
      id_5,
      id_5,
      id_3,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_5,
      id_3,
      id_1,
      id_1,
      id_5,
      id_1,
      id_1,
      id_1,
      id_1
  );
  inout wire id_1;
  logic [7:0] id_6, id_7;
endmodule
