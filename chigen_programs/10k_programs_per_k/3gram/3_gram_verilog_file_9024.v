// Seed: 2052647166
module module_0 (
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
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_2 = 1 - id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = 1;
  wire id_10;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_10,
      id_10,
      id_5,
      id_6,
      id_7
  );
  id_11 :
  assert property (@(posedge 1) id_2[1])
  else id_11 = 1;
endmodule
