// Seed: 1572179385
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
    id_11
);
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_12;
endmodule
module module_1 #(
    parameter id_10 = 32'd87,
    parameter id_2  = 32'd6,
    parameter id_5  = 32'd1
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire _id_5;
  input wire id_4;
  input wire id_3;
  input wire _id_2;
  output wire id_1;
  logic id_9;
  ;
  logic [-1 : 1 'b0 -  id_5  &&  id_2] _id_10 = {-1'd0{~id_9 !== id_2}};
  wire [id_10 : -1] id_11;
  logic [{  -1  ,  -1  } : id_2] id_12 = id_9;
  module_0 modCall_1 (
      id_1,
      id_11,
      id_11,
      id_9,
      id_9,
      id_9,
      id_6,
      id_11,
      id_12,
      id_12,
      id_9
  );
endmodule
