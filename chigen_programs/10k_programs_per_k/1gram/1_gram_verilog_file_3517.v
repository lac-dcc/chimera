// Seed: 2116434378
module module_0 (
    input wor id_0,
    input wire id_1,
    input supply0 id_2,
    input wire id_3,
    input tri id_4,
    input supply1 id_5,
    input wand id_6,
    input tri0 id_7,
    input tri1 id_8,
    input wire id_9,
    input supply0 id_10,
    output supply0 id_11,
    input wire id_12,
    output supply1 id_13,
    input uwire id_14,
    input supply1 id_15
);
  assign id_13 = 1;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input wand id_0,
    input wand id_1,
    output wand id_2,
    input supply0 id_3,
    input wand id_4,
    input supply1 id_5,
    input wand id_6,
    input tri id_7,
    output wire id_8,
    input wire id_9,
    input tri id_10,
    output tri id_11
);
  and primCall (id_2, id_9, id_3, id_6);
  parameter id_13 = !1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_1,
      id_5,
      id_1,
      id_9,
      id_7,
      id_10,
      id_10,
      id_5,
      id_1,
      id_2,
      id_6,
      id_8,
      id_5,
      id_7
  );
  assign id_2 = id_3;
endmodule
