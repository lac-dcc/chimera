// Seed: 437312426
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
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  parameter id_13 = 1;
  assign id_7 = id_11;
  assign module_1.id_5 = 0;
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
  output wire id_6;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_6,
      id_1,
      id_4,
      id_1,
      id_6,
      id_1,
      id_3,
      id_6,
      id_1,
      id_1
  );
  output uwire id_5;
  input wire id_4;
  xor primCall (id_5, id_2, id_1, id_7, id_4);
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_5 = 1;
endmodule
