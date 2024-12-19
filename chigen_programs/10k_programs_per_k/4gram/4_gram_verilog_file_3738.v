// Seed: 3538609292
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input wor id_2,
    output wor id_3,
    output wire id_4,
    output uwire id_5,
    output supply0 id_6,
    input wire id_7,
    output uwire id_8,
    input supply0 id_9,
    output uwire id_10,
    output supply0 id_11,
    output tri id_12,
    output supply1 id_13,
    input tri id_14
);
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  tri0  id_0,
    output wand  id_1,
    input  wor   id_2,
    input  tri   id_3,
    input  uwire id_4,
    input  uwire id_5,
    input  tri   id_6
);
  assign id_1 = ~id_4;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_5,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2
  );
endmodule
