// Seed: 388072052
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_6 = id_5;
  assign id_5 = id_1;
  int   id_7;
  wire  id_8;
  wire  id_9;
  uwire id_10 = 1;
  uwire id_11 = 1;
  wire  id_12;
  assign id_6 = id_10;
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
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = id_3 & 1 & 1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_5,
      id_3,
      id_3,
      id_3
  );
endmodule
