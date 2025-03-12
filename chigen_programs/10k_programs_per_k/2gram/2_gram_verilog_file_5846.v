// Seed: 3003338447
module module_0 (
    module_0,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  parameter id_8 = -1;
  id_9 :
  assert property (@(posedge id_9) id_3 & 1)
  else;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4#(.id_5(-1)),
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_10,
      id_10,
      id_10,
      id_7
  );
  output supply0 id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = 1;
endmodule
