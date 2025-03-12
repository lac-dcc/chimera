// Seed: 1611146022
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
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_14;
  tri1 id_15;
  assign id_15 = -1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input logic [7:0] id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_3,
      id_4,
      id_5,
      id_2,
      id_3,
      id_4,
      id_4,
      id_4,
      id_5,
      id_4
  );
  output wire id_1;
  id_9 :
  assert property (@(posedge id_7#(.id_2(-1)) [1'b0 :-1]) id_5)
  else $signed(8);
  ;
  nand primCall (id_6, id_7, id_4, id_2, id_3, id_5);
endmodule
