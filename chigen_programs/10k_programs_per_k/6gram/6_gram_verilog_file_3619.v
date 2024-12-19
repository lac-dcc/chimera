// Seed: 3539439282
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input wand id_2,
    input supply1 id_3,
    input supply0 id_4,
    output tri0 id_5,
    output wand id_6
);
  assign id_6 = 1;
  wire id_8;
  assign id_5 = id_2;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output wor id_0,
    input tri1 id_1,
    input tri id_2,
    input tri1 id_3,
    input supply0 id_4,
    output wand id_5,
    output uwire id_6
);
  assign id_0 = 1'h0 == id_1;
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4,
      id_1,
      id_3,
      id_6,
      id_5
  );
  wire id_9;
  supply1 id_10;
  assign id_10 = 1;
endmodule
