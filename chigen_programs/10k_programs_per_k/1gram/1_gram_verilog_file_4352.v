// Seed: 3465379732
module module_0 (
    input supply0 id_0,
    input wire id_1,
    input wand id_2,
    input wor id_3,
    output supply0 id_4,
    output uwire id_5,
    input tri0 id_6,
    output wire id_7,
    input tri id_8,
    input supply0 id_9,
    input tri1 id_10,
    input wire id_11
);
  assign id_4 = id_10.id_8;
  assign module_1.type_17 = 0;
  integer id_13;
endmodule
module module_1 (
    input tri1 id_0,
    input supply0 id_1,
    input supply0 id_2,
    output wor id_3,
    output wand id_4,
    output supply0 id_5,
    input uwire id_6,
    output wire id_7,
    input wire id_8,
    input wire id_9,
    input tri id_10
);
  assign id_5 = id_6;
  wire id_12;
  nand primCall (id_4, id_2, id_12, id_9);
  module_0 modCall_1 (
      id_10,
      id_10,
      id_8,
      id_8,
      id_5,
      id_5,
      id_8,
      id_7,
      id_1,
      id_0,
      id_0,
      id_1
  );
endmodule
