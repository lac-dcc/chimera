// Seed: 2498206644
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
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input logic [7:0] id_1;
  logic id_12 = id_1;
endmodule
module module_1 #(
    parameter id_3 = 32'd76
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_4,
      id_5,
      id_5,
      id_4,
      id_5,
      id_4,
      id_1,
      id_1
  );
  output wire _id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  wire id_6 = id_2;
  rpmos (-1 !=? id_1, 1, id_1, -1, 1);
  id_7 :
  assert property (@(posedge id_7) id_5)
  else $signed(69);
  ;
endmodule
