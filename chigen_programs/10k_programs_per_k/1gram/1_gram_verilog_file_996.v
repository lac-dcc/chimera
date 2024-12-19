// Seed: 1884755306
module module_0 (
    input tri1 id_0,
    input tri id_1,
    input wor id_2,
    output supply0 id_3,
    input wand id_4,
    output uwire id_5,
    input supply0 id_6,
    output wire id_7
);
  wire id_9;
  assign module_1.type_8 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    output supply0 id_1,
    output wand id_2,
    input wire id_3,
    output wire id_4,
    input tri0 id_5,
    input tri1 id_6
);
  assign id_4 = 1;
  assign id_0 = 1;
  assign id_1 = !1;
  xor primCall (id_1, id_5, id_3, id_6);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_2,
      id_5,
      id_0,
      id_5,
      id_1
  );
endmodule
