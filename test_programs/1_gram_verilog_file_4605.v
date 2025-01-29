// Seed: 2249955977
module module_0 (
    output supply0 id_0,
    input wor id_1,
    input wire id_2,
    output wand id_3,
    input tri id_4,
    input uwire id_5,
    input uwire id_6,
    output wor id_7,
    output supply1 id_8
);
  assign id_3 = 1 - 1 && {(~^id_4), -1};
  assign id_7 = -1;
  wire id_10;
  wire id_11;
  parameter id_12 = ^id_1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input tri id_0,
    input tri1 id_1,
    output wand id_2,
    input supply0 id_3,
    output wand id_4,
    output wor id_5,
    output wire id_6
);
  wire id_8 = id_0;
  nand primCall (id_5, id_9, id_3);
  bit id_9, id_10 = id_10;
  initial id_9 <= 1;
  initial id_9 <= 1;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_1,
      id_6,
      id_1,
      id_0,
      id_1,
      id_4,
      id_8
  );
endmodule
