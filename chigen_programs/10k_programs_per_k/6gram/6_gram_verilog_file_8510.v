// Seed: 2695952285
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  parameter id_3 = 1;
  parameter id_4 = -1;
  wire id_5;
endmodule
module module_1 #(
    parameter id_0 = 32'd7,
    parameter id_2 = 32'd59
) (
    output wor  _id_0,
    output wand id_1,
    output tri1 _id_2
);
  struct packed {
    logic [id_2 : id_0] id_4;
    logic [id_0 : {  1  {  1 'b0 }  }] id_5;
  } id_6[id_0];
  module_0 modCall_1 (
      id_5,
      id_5
  );
endmodule
module module_2 #(
    parameter id_2 = 32'd76,
    parameter id_4 = 32'd50,
    parameter id_6 = 32'd55,
    parameter id_9 = 32'd60
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    _id_9
);
  inout wire _id_9;
  output wire id_8;
  input wire id_7;
  input wire _id_6;
  input wire id_5;
  inout wire _id_4;
  inout wire id_3;
  inout wire _id_2;
  input wire id_1;
  logic [(  id_2  ?  id_4  ^  -1 'd0 : id_2  ^  id_6  ) : id_2] id_10;
  module_0 modCall_1 (
      id_3,
      id_3
  );
  xor primCall (id_8, id_7, id_3, id_10, id_5);
  supply0 [1  !=?  id_9 : (  1 'h0 ?  -1 : 1  )] \id_11 ;
  wire [id_9  -  -1 : ""] id_12;
  wire id_13;
  wire id_14;
  assign \id_11 = -1'd0;
  logic id_15;
  ;
endmodule
