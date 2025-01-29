// Seed: 1120118262
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    input wire id_2,
    id_7,
    input tri0 id_3,
    input wire id_4,
    input wor id_5
);
  wire id_8;
  wire id_9, id_10;
endmodule
module module_1 (
    input wire id_0,
    input wor id_1,
    input wor id_2,
    input tri1 id_3,
    output tri1 id_4,
    output tri id_5,
    input tri0 id_6,
    output wor id_7,
    output supply0 id_8,
    output wand id_9
);
  wire id_11;
  wire id_12;
  assign id_4 = !id_6;
  wor id_13 = id_1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_1,
      id_3,
      id_2,
      id_13
  );
  assign modCall_1.id_0 = 0;
endmodule
