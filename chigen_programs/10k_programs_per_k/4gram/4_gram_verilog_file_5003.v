// Seed: 2734160260
module module_0 (
    output supply0 id_0,
    input uwire id_1,
    output wand id_2,
    output tri0 id_3,
    input tri id_4,
    input wand id_5,
    input tri0 id_6,
    output uwire id_7,
    output wire id_8,
    output supply0 id_9,
    input tri1 id_10
);
  wire id_12;
endmodule
module module_1 (
    input wor id_0,
    input wand id_1,
    input tri0 id_2,
    output wand id_3,
    output wire id_4,
    input uwire id_5,
    input uwire id_6,
    input uwire id_7,
    output supply1 id_8,
    input supply0 id_9
);
  assign id_8 = 1 ? id_0 : id_6;
  assign id_4 = id_7 ? 1 & 1'b0 - id_5 : 1;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_8,
      id_3,
      id_5,
      id_6,
      id_7,
      id_4,
      id_8,
      id_3,
      id_1
  );
endmodule
