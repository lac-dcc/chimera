// Seed: 762556514
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  logic [-1 : 1 'b0] id_7 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_5,
      id_3,
      id_6,
      id_1
  );
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  id_8 :
  assert property (@(posedge id_5) -1)
  else $unsigned(81);
  ;
endmodule
