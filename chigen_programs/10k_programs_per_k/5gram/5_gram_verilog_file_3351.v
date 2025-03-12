// Seed: 3808165286
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
    id_13
);
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  assign module_1.id_2 = 0;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  logic id_14;
endmodule
module module_1 #(
    parameter id_0 = 32'd32,
    parameter id_3 = 32'd60
) (
    input  uwire _id_0,
    output wire  id_1,
    input  tri   id_2,
    input  tri   _id_3
);
  wire id_5;
  logic [{  -1  ,  id_0  &  -1 'b0 } : {  (  1 'b0 -  id_3  )  ,  id_3  }] id_6, id_7;
  wire id_8;
  module_0 modCall_1 (
      id_5,
      id_8,
      id_5,
      id_6,
      id_5,
      id_6,
      id_7,
      id_7,
      id_5,
      id_8,
      id_8,
      id_6,
      id_5
  );
endmodule
