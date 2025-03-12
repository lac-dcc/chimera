// Seed: 4023067204
module module_0 (
    output wand id_0,
    input supply1 id_1,
    input supply1 id_2,
    input wire id_3,
    input uwire id_4,
    input uwire id_5,
    output tri0 id_6
);
endmodule
module module_1 (
    output supply0 id_0,
    output supply0 id_1,
    input wor id_2,
    input wand id_3,
    input tri1 id_4,
    input wire id_5,
    input wire id_6,
    input wor id_7,
    input tri id_8
);
  wire id_10;
  assign id_10 = id_6;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_8,
      id_4,
      id_5,
      id_1
  );
  assign modCall_1.id_5 = 0;
endmodule
