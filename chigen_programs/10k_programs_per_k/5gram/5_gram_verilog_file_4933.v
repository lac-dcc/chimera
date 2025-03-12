// Seed: 4027380703
module module_0 #(
    parameter id_3 = 32'd76,
    parameter id_5 = 32'd9
) (
    module_0,
    id_2,
    _id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire _id_5;
  input wire id_4;
  input wire _id_3;
  inout wire id_2;
  input wire id_1;
  assign id_8 = id_5;
  wire  [  id_3  :  1  /  id_5  ]  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ;
  wire id_30;
endmodule
module module_1 #(
    parameter id_1  = 32'd24,
    parameter id_10 = 32'd24,
    parameter id_11 = 32'd69,
    parameter id_18 = 32'd33,
    parameter id_3  = 32'd47,
    parameter id_8  = 32'd27,
    parameter id_9  = 32'd31
) (
    _id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8
);
  input wire _id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire _id_3;
  inout wire id_2;
  inout wire _id_1;
  wire _id_9;
  ;
  nor primCall (id_5, id_6, id_4, id_2);
  assign id_2 = id_2;
  parameter id_10 = 1;
  logic [id_8 : id_1  (  {  id_9  {  -1  }  }  )] _id_11;
  ;
  parameter id_12 = 1;
  module_0 modCall_1 (
      id_4,
      id_12,
      id_10,
      id_2,
      id_10,
      id_4,
      id_12,
      id_12
  );
  struct packed {
    logic [id_11 : 1] id_13;
    logic [id_10 : id_3] id_14;
  } [id_8 : id_1] id_15;
  ;
  wire id_16;
  parameter id_17 = id_10;
  assign id_16 = id_17;
  logic [1 : ""] _id_18;
  parameter id_19 = 1'h0;
  wire [id_10 : id_18] id_20;
  always @(*) begin : LABEL_0
    if (id_17[id_11]) $unsigned(id_10);
    ;
  end
endmodule
