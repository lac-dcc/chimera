// Seed: 2390495741
module module_0 #(
    parameter id_11 = 32'd57,
    parameter id_15 = 32'd85,
    parameter id_7  = 32'd76
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5;
  final begin : LABEL_0
    $signed(73);
    ;
  end
  wire id_6;
  ;
  parameter id_7 = -1'd0 && "";
  wire id_8;
  ;
  supply1  [  id_7  :  1  ]  id_9  =  1 'b0 ,  id_10  =  (  id_7  &  -1  )  ,  _id_11  =  1  ,  id_12  =  id_5  ,  id_13  =  1  &&  -1  -  1  ,  id_14  =  id_13  ,  _id_15  =  1  ,  id_16  =  -1  ;
  tri0 [id_15  -  -1 : id_11] id_17 = {id_9{id_5}} ? 1 : (-1);
  parameter id_18 = id_7;
  logic [1  &  1 : -1 'b0] id_19;
  ;
endmodule
module module_1 #(
    parameter id_13 = 32'd86,
    parameter id_6  = 32'd33
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    _id_13,
    id_14
);
  inout wire id_14;
  input wire _id_13;
  module_0 modCall_1 (
      id_8,
      id_1,
      id_8,
      id_4
  );
  assign modCall_1.id_12 = 0;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire _id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  logic [id_6 : id_13  &  1] id_15 = id_7;
endmodule
