// Seed: 1502876689
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
  output wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_6 = $realtime;
  assign id_6 = $realtime ? id_12 : 1;
  wire id_14;
  specify
    (id_15 + => id_16) = (1, 1  : id_16  : 1);
  endspecify
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  input wire id_1;
  parameter id_4 = $realtime;
  wire id_5;
  assign id_2 = $realtime;
  assign id_2 = 1 ? id_1 : 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_1,
      id_5,
      id_4,
      id_5,
      id_3,
      id_5,
      id_4
  );
endmodule
