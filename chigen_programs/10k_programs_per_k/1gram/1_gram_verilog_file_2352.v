// Seed: 570384630
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_3 = id_1;
  wire  id_4;
  logic id_5;
  wire id_6, id_7;
  assign id_7 = id_4;
  assign id_7 = id_6;
endmodule
module module_1 #(
    parameter id_10 = 32'd58,
    parameter id_4  = 32'd45,
    parameter id_6  = 32'd15
) (
    id_1,
    id_2,
    id_3,
    _id_4[id_4<-1'b0&1'b0-1 : 1],
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9[id_6 :-1],
    _id_10
);
  input wire _id_10;
  inout logic [7:0] id_9;
  input logic [7:0] id_8;
  output wire id_7;
  inout wire _id_6;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
  input wire id_5;
  output logic [7:0] _id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_9 = id_8[id_10];
  xor primCall (id_9, id_8, id_1, id_5, id_2);
endmodule
