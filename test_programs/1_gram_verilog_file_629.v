// Seed: 2217305657
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4;
  final if (id_2);
  wire id_5, id_6, id_7;
  assign id_3 = id_2;
endmodule
module module_1 (
    input wire id_0,
    input supply0 id_1
);
  final id_3 <= -1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4
  );
endmodule
module module_2 (
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
    id_14
);
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  id_15 :
  assert property (@(*) id_13) id_8 <= id_9;
  parameter id_16 = 1'b0;
  wire id_17;
  module_0 modCall_1 (
      id_6,
      id_17,
      id_3
  );
  assign modCall_1.id_3 = 0;
  always do #1 id_5 <= id_9; while (id_5);
endmodule
