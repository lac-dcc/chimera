// Seed: 3425255720
module module_0 (
    input wand id_0,
    output tri0 id_1,
    input supply0 id_2,
    output wire id_3,
    input wire id_4,
    input tri0 id_5,
    input tri1 id_6
);
  wire id_8;
  assign id_1 = id_6;
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    input wand id_2,
    input wire id_3,
    output tri0 id_4,
    input tri id_5,
    output wand id_6
);
  wire id_8, id_9, id_10, id_11, id_12;
  wire id_13;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_1,
      id_4,
      id_1,
      id_3,
      id_3
  );
  assign modCall_1.type_2 = 0;
  wire id_14, id_15;
  supply0 id_16 = 1;
endmodule
