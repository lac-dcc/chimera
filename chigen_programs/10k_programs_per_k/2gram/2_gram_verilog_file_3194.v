// Seed: 2908756088
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
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
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
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_10;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_10,
      id_10,
      id_5,
      id_10,
      id_7,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_2,
      id_10,
      id_9,
      id_2,
      id_1
  );
  logic [1 : -1] id_11;
  assign id_10 = id_9;
  id_12 :
  assert property (@('d0) (id_10))
  else;
  logic id_13;
  ;
endmodule
