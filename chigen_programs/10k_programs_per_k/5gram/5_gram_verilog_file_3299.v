// Seed: 3533601624
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
    id_10
);
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
  assign id_3 = 1;
  timeprecision 1ps;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  module_0(
      id_3, id_6, id_3, id_4, id_3, id_4, id_5, id_5, id_3, id_6
  );
  assign id_6 = id_4;
  nand (id_6, id_2, id_4, id_1, id_3, id_5);
  wire id_7;
  wire id_8;
endmodule
