// Seed: 1111400200
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  assign id_2 = ~|1 | 1 | id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_7 = id_6 + id_3;
  nand primCall (id_1, id_7, id_3, id_8, id_4);
  module_0 modCall_1 (
      id_7,
      id_1
  );
  assign id_5[1] = id_8;
  wire id_9;
endmodule
