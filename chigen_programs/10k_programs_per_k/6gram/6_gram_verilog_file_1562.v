// Seed: 2652200347
module module_0 (
    input wire id_0,
    input tri1 id_1,
    output wand id_2,
    input tri0 id_3,
    input supply1 id_4,
    input uwire id_5,
    input tri1 id_6,
    input supply1 id_7,
    input supply0 id_8,
    input uwire id_9
);
  wire id_11;
endmodule
module module_1 (
    output wire id_0,
    input tri0 id_1,
    input uwire id_2,
    input wire id_3,
    input supply1 id_4
);
  wire id_6;
  xnor primCall (id_0, id_2, id_4);
  assign id_0 = id_3;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_0,
      id_1,
      id_2,
      id_3,
      id_4,
      id_4,
      id_2,
      id_1
  );
  assign modCall_1.id_7 = 0;
endmodule
