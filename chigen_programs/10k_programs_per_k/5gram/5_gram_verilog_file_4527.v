// Seed: 2697379025
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(id_2 | id_3 or id_3) $signed(63);
  ;
  parameter id_6 = -1;
  wire id_7;
  ;
endmodule
module module_1 #(
    parameter id_14 = 32'd49,
    parameter id_2  = 32'd96,
    parameter id_4  = 32'd23,
    parameter id_7  = 32'd18,
    parameter id_9  = 32'd45
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    _id_9,
    id_10,
    id_11
);
  input wire id_11;
  input wire id_10;
  inout wire _id_9;
  output supply0 id_8;
  output wire _id_7;
  output wire id_6;
  input wire id_5;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_3,
      id_1,
      id_6
  );
  inout wire _id_4;
  inout wire id_3;
  output wire _id_2;
  output wor id_1;
  logic [-1 : -1] id_12 = id_10 == id_5;
  always @(*) id_12 -= id_9;
  assign id_8 = 1;
  logic [id_9 : -1] id_13[-1 'b0 : ""];
  assign id_8 = id_11 ^ id_13;
  logic [id_4  &  id_7 : 1] _id_14;
  tri0 id_15 = 1;
  logic [id_2 : id_14] id_16;
  assign  id_1  =  -1  ?  -1  :  -1  ?  id_16  :  1  ?  1  :  id_5  ==  id_11  ?  id_3  :  id_4  ?  id_10  !=?  1  -  id_11  :  id_12  ?  -1  :  id_10  ?  id_3  -  id_13  :  1  ;
  assign id_1 = id_14;
endmodule
