// Seed: 72442992
module module_0 (
    output wor id_0,
    output supply1 id_1,
    input tri1 id_2,
    output wand id_3,
    output wire id_4,
    output tri0 id_5,
    output supply1 id_6,
    output tri id_7,
    input tri0 id_8,
    output tri1 id_9
);
  assign id_0 = -1;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd76
) (
    output supply0 id_0,
    output tri id_1,
    output wand id_2,
    input tri0 _id_3#(.id_6(-1)),
    input tri0 id_4
);
  logic id_7[1  |  1 : id_3] = -1;
  wire id_8, id_9;
  nor primCall (id_0, id_7, id_8, id_9, id_6);
  assign id_6 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_0,
      id_1,
      id_1,
      id_2,
      id_4,
      id_0
  );
  wire id_10;
endmodule
