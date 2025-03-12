// Seed: 15626872
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  logic [1 'b0 : -1] id_9 = id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_2 = id_3;
  assign id_1 = id_1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_3,
      id_4,
      id_4,
      id_3,
      id_4
  );
  logic [1 : 1] id_5;
  ;
  parameter id_6 = 1;
  always deassign id_1[(-1) : 1];
  id_7 :
  assert property (@(posedge 1) id_1)
  else assign id_1 = id_7;
endmodule
