// Seed: 1523673082
module module_0 (
    input uwire id_0,
    input tri id_1,
    output uwire id_2,
    output wor id_3,
    output wor id_4,
    input uwire id_5,
    output uwire id_6,
    input uwire id_7,
    input wand id_8,
    input wire id_9,
    input wor id_10,
    input supply0 id_11,
    input supply1 id_12,
    input wand id_13,
    output supply1 id_14
);
  initial id_3 = 1'b0;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    input wire id_2,
    input supply1 id_3,
    input tri1 id_4,
    output tri id_5
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_5,
      id_5,
      id_5,
      id_3,
      id_5,
      id_4,
      id_2,
      id_1,
      id_4,
      id_1,
      id_1,
      id_3,
      id_5
  );
  assign id_5 = 1 - id_4;
  wand id_7;
  assign id_7 = 1 | 1;
endmodule
