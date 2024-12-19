// Seed: 67295230
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    input wor id_2,
    output wire id_3,
    output tri1 id_4,
    output tri0 id_5,
    output wand id_6,
    input supply0 id_7,
    input tri id_8,
    output uwire id_9
);
  assign id_5 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    input tri id_1,
    output wand id_2,
    input wor id_3,
    input tri id_4,
    output supply1 id_5,
    input supply0 id_6,
    output supply1 id_7
);
  logic [7:0] id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_2,
      id_5,
      id_5,
      id_5,
      id_1,
      id_3,
      id_2
  );
  assign modCall_1.type_1 = 0;
  logic [7:0] id_10;
  assign id_9[1] = 1 && id_0 ? (1) : 1;
  assign id_10   = id_9;
endmodule
