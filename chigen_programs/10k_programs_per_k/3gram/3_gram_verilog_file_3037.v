// Seed: 1717520705
module module_0 (
    input wand id_0,
    input tri id_1,
    output supply1 id_2,
    input tri1 id_3,
    input wor id_4,
    input tri id_5,
    input supply1 id_6,
    output supply0 id_7
);
  module_0 id_9;
  assign id_2 = id_4;
  wire id_10;
endmodule
module module_1 (
    output wand id_0,
    input supply0 id_1,
    output wand id_2,
    input wire id_3,
    input wire id_4,
    input tri0 id_5,
    output supply1 id_6,
    input supply0 id_7,
    input wor id_8
);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_8,
      id_5,
      id_3,
      id_5,
      id_6
  );
  assign modCall_1.id_6 = 0;
  always @*;
endmodule
