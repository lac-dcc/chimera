// Seed: 1342184523
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
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  assign module_1.id_5 = 0;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
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
    id_9,
    id_10,
    id_11
);
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  nor primCall (id_8, id_6, id_1, id_9, id_4, id_11, id_7, id_3);
  output tri1 id_5;
  inout logic [7:0] id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_7,
      id_9,
      id_7,
      id_10,
      id_11,
      id_8
  );
  parameter id_12 = 1;
  wire id_13;
  assign id_5 = 1 && -1;
  assign id_8 = -1;
  always id_4[-1] <= id_11;
endmodule
