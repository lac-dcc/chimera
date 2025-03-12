// Seed: 4081183303
module module_0 (
    output tri id_0,
    input supply1 id_1,
    output uwire id_2,
    input tri1 id_3,
    output supply1 id_4,
    input wire id_5,
    input wand id_6,
    output wor id_7,
    output supply1 id_8,
    input wor id_9,
    output wand id_10,
    input wand id_11,
    output tri1 id_12,
    input tri0 id_13,
    input tri1 id_14,
    input supply1 id_15
);
  wire id_17;
  assign id_7 = id_9;
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd36
) (
    output uwire id_0,
    output wor   id_1,
    output wor   _id_2,
    input  uwire id_3
);
  parameter id_5 = 1;
  uwire   [-1 'b0 : 1] id_6 = id_6 << 1;
  integer [ id_2 : -1] id_7 = -1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_0,
      id_3,
      id_0,
      id_3,
      id_3,
      id_0,
      id_1,
      id_3,
      id_1,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3
  );
endmodule
