// Seed: 750356198
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
    id_12
);
  input wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_4 = id_12;
  wire id_13, id_14;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  parameter id_4 = 1;
  always_latch
  fork
    $signed(17);
    ;
    id_1[-1] = id_2;
  join
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_3,
      id_4,
      id_4,
      id_3,
      id_4,
      id_3,
      id_4,
      id_2,
      id_2
  );
endmodule
