// Seed: 3622729435
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign module_1.id_6 = 0;
  logic [1 : 1 'b0] id_4;
  ;
endmodule
module module_1 #(
    parameter id_6 = 32'd72
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire _id_6;
  input logic [7:0] id_5;
  input wire id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_7
  );
  inout wire id_2;
  output wire id_1;
  id_10 :
  assert property (@(posedge 1) id_5[-1])
  else $signed(11);
  ;
  always @(1 or posedge 1'b0) id_10 = id_4;
  logic ["" : id_6] id_11;
endmodule
