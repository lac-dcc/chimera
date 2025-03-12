// Seed: 3328438191
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input wor id_2,
    output uwire id_3,
    input supply1 id_4
    , id_8,
    output tri id_5,
    input wand id_6
);
  assign id_3 = id_8 + 1;
  assign module_1.id_6 = 0;
  logic id_9 = id_8;
endmodule
module module_1 #(
    parameter id_12 = 32'd46
) (
    input tri id_0,
    output uwire id_1,
    input wand id_2,
    input wand id_3['b0 : 1  -  -1 'b0 -  id_12],
    output uwire id_4,
    input tri id_5,
    output wor id_6,
    output supply1 id_7,
    output tri id_8,
    input wire id_9,
    output uwire id_10,
    input tri0 id_11,
    output supply1 _id_12
);
  module_0 modCall_1 (
      id_5,
      id_0,
      id_9,
      id_8,
      id_0,
      id_7,
      id_5
  );
  assign id_1 = -1;
  assign id_4 = (~!-1);
  nor primCall (id_4, id_3, id_11, id_9, id_2, id_0);
endmodule
