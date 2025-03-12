// Seed: 1204326295
module module_0 (
    output wand id_0,
    input tri id_1,
    output wand id_2,
    input supply0 id_3,
    output wor id_4,
    input wire id_5,
    output wire id_6,
    input tri0 id_7,
    input tri1 id_8
);
  logic [-1 : 1] id_10;
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    input supply1 id_2,
    input wand id_3,
    output supply1 id_4,
    output supply0 id_5,
    input wor id_6,
    output tri id_7
);
  wor [1 : 1] id_9 = id_1 ==? id_2;
  logic id_10;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_4,
      id_1,
      id_4,
      id_2,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
