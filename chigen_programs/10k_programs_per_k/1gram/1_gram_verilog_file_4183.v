// Seed: 1937814062
module module_0 #(
    parameter id_14 = 32'd98
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
    id_11
);
  input wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout supply1 id_3;
  output wire id_2;
  inout wire id_1;
  wire id_12;
  parameter id_13 = 1;
  logic _id_14;
  wire  id_15;
  ;
  wire [id_14 : 1] id_16;
  logic id_17;
  ;
  assign id_3 = -1;
  logic id_18;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd36,
    parameter id_2 = 32'd33
) (
    _id_1,
    _id_2
);
  input wire _id_2;
  input wire _id_1;
  parameter \id_3 = 1 == 1'b0;
  supply1 [1 : id_2] id_4[1 : (  id_2  )];
  localparam id_5 = \id_3 ;
  assign id_4 = 1;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_4,
      \id_3 ,
      id_5,
      id_4,
      id_5,
      id_5,
      id_5,
      id_5,
      id_4
  );
  wire [id_1 : 1  +  id_2] id_6, id_7, id_8;
  logic id_9;
  ;
endmodule
