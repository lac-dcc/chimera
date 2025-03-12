// Seed: 3331144085
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input wire id_2,
    input tri id_3,
    output tri1 id_4,
    input supply1 id_5,
    output supply1 id_6,
    input uwire id_7,
    input supply0 id_8,
    input tri1 id_9
);
  logic id_11, id_12;
  assign id_4 = id_12;
endmodule
module module_1 (
    input tri0 id_0,
    output tri1 id_1,
    input wire id_2,
    output wire id_3,
    input supply1 id_4,
    input uwire id_5,
    input wand id_6,
    output tri0 id_7,
    input supply0 id_8,
    input tri id_9
);
  assign id_7 = 1;
  xor primCall (id_1, id_9, id_6, id_2, id_8, id_5, id_0, id_4);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_9,
      id_1,
      id_6,
      id_7,
      id_2,
      id_2,
      id_9
  );
  assign modCall_1.id_2 = 0;
endmodule
