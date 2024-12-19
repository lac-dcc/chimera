// Seed: 3815320925
module module_0 (
    output wor id_0,
    input wire id_1,
    input tri id_2,
    input wand id_3,
    input wire id_4,
    input supply1 id_5,
    input tri1 id_6,
    output tri1 id_7,
    input supply1 id_8,
    output wor id_9,
    input wire id_10,
    input supply0 id_11,
    output uwire id_12,
    input tri id_13
);
  assign id_7 = 1;
  wire id_15;
  tri1 id_16 = 1;
  assign module_1.type_0 = 0;
  assign id_0 = id_6 == 1;
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    input wor id_2,
    input supply1 id_3,
    input supply0 id_4,
    input wor id_5,
    output wire id_6,
    input supply0 id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_3,
      id_5,
      id_3,
      id_5,
      id_6,
      id_3,
      id_0,
      id_4,
      id_5,
      id_0,
      id_1
  );
  wire id_10;
  nor primCall (id_6, id_4, id_7, id_5, id_2, id_3, id_9);
endmodule
