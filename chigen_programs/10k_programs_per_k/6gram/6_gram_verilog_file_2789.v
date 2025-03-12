// Seed: 37127097
module module_0 (
    output tri id_0,
    output tri1 id_1,
    output uwire id_2,
    input supply0 id_3,
    output wire id_4,
    input wor id_5,
    input supply1 id_6,
    output wor id_7
);
  assign id_0 = id_6;
  assign id_2 = -1;
  wire id_9;
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    input tri0 id_2,
    output tri id_3,
    input tri1 id_4,
    output uwire id_5,
    output wire id_6,
    output wor id_7,
    output wand id_8
);
  assign id_7 = id_4;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_5,
      id_0,
      id_5,
      id_1,
      id_0,
      id_6
  );
  assign modCall_1.id_0 = 0;
endmodule
