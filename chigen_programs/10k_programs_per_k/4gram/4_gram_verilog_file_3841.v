// Seed: 64095392
module module_0 (
    input wand id_0,
    input tri1 id_1,
    output tri0 id_2,
    input tri0 id_3,
    output supply0 id_4,
    output tri1 id_5,
    input wor id_6,
    output tri id_7,
    input wand id_8,
    input tri0 id_9
);
  assign id_7 = id_6 && id_8;
  wire id_11;
endmodule
module module_1 (
    output tri1 id_0,
    input tri id_1,
    output supply0 id_2,
    output wand id_3,
    output uwire id_4,
    input supply0 id_5,
    input wire id_6,
    output tri0 id_7
);
  assign id_3 = id_1;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_1,
      id_3,
      id_4,
      id_5,
      id_2,
      id_6,
      id_5
  );
  assign modCall_1.id_6 = 0;
endmodule
