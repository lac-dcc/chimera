// Seed: 4084397999
module module_0 #(
    parameter id_9 = 32'd18
) (
    id_1,
    module_0,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9
);
  inout wire _id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic [id_9 : 1 'b0 ==  -1] id_10;
  ;
endmodule
module module_1 #(
    parameter id_11 = 32'd3,
    parameter id_8  = 32'd0
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8
);
  inout wire _id_8;
  input logic [7:0] id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  localparam id_9 = -1;
  logic id_10, _id_11 = id_7[id_11 :-1==~id_8];
  assign #id_12 id_1 = id_7;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_9,
      id_4,
      id_5,
      id_9,
      id_5,
      id_12
  );
  assign id_10[id_8] = 1;
endmodule
