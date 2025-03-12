// Seed: 4260036343
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
    id_10
);
  input wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout supply1 id_2;
  input wire id_1;
  assign id_2 = 1'b0;
  assign id_9 = id_8;
  assign id_6 = id_5;
  wire id_11, id_12, id_13, id_14;
  wire id_15;
  wire id_16;
  wire \id_17 ;
  wire id_18;
endmodule
module module_1 #(
    parameter id_5 = 32'd32
) (
    id_1,
    id_2,
    id_3,
    id_4[id_5 :-1'd0],
    _id_5,
    id_6
);
  output wire id_6;
  inout wire _id_5;
  input logic [7:0] id_4;
  output wire id_3;
  inout supply0 id_2;
  input wire id_1;
  logic id_7[1 : -1];
  ;
  assign id_2 = -1'b0;
  assign id_7 = id_5;
  assign id_5 = id_7;
  wire id_8;
  ;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_7,
      id_1,
      id_7,
      id_7,
      id_2,
      id_7,
      id_7,
      id_1
  );
endmodule
