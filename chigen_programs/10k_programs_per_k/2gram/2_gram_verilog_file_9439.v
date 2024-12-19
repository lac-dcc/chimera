// Seed: 200617473
module module_0 (
    output wand id_0#(.id_10(1'b0)),
    input tri id_1,
    output wand id_2,
    input wor id_3,
    input wire id_4,
    input supply0 id_5,
    input wire id_6,
    output tri1 id_7,
    output supply1 id_8
);
  logic [7:0] id_11;
  wire id_12;
  pmos (id_2);
  wire id_13;
  assign id_11[1] = 1;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    output supply0 id_2,
    input wor id_3,
    input wire id_4,
    input supply0 id_5,
    output wor id_6
);
  assign id_6 = 1;
  assign id_2 = id_3;
  assign id_6 = 1;
  wire id_8;
  wire id_9;
  nand primCall (id_6, id_5, id_4, id_9);
  module_0 modCall_1 (
      id_1,
      id_3,
      id_1,
      id_0,
      id_5,
      id_3,
      id_5,
      id_1,
      id_6
  );
  assign modCall_1.type_14 = 0;
endmodule
