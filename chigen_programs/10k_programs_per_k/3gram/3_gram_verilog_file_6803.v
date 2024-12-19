// Seed: 47054501
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
  assign module_1.id_9 = 0;
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
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  id_8 :
  assert property (@(id_2[1 : 1]) 1)
  else id_8 = #id_9 1;
  assign id_4 = 1;
  wire id_10;
  assign id_5 = id_8;
  wire id_11;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_10,
      id_7,
      id_3,
      id_10
  );
endmodule
