// Seed: 2288414001
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
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  wire id_7;
  wire id_8;
  wire id_9;
  wire id_10;
  parameter id_11 = -1'b0;
  wire id_12;
  assign id_9 = id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  nand primCall (id_4, id_2, id_3);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2
  );
endmodule
