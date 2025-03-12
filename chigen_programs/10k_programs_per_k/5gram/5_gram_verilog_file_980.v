// Seed: 862660083
module module_0 #(
    parameter id_14 = 32'd44
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
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  input logic [7:0] id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire _id_14;
  ;
  parameter id_15 = 1;
  assign id_3 = id_10[id_14!=1];
endmodule
module module_1;
  logic [7:0] id_1;
  id_2 :
  assert property (@(posedge id_1[1'b0]) 1)
  else $clog2(29);
  ;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2
  );
endmodule
