// Seed: 4114971878
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input tri id_2,
    output wire id_3,
    output tri1 id_4,
    output uwire id_5,
    input wand id_6,
    output tri1 id_7,
    input wor id_8,
    input tri1 id_9,
    output wand id_10,
    input wire id_11
);
  assign module_1.type_1 = 0;
  assign id_3 = 1'b0;
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1,
    input supply0 id_2,
    input wand id_3,
    output tri1 id_4
);
  assign id_4 = (id_2);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_4,
      id_4,
      id_4,
      id_0,
      id_4,
      id_3,
      id_2,
      id_4,
      id_1
  );
endmodule
