// Seed: 2221039563
module module_0 (
    input tri1 id_0,
    input wand id_1,
    output uwire id_2,
    input tri0 id_3,
    input tri1 id_4,
    input wor id_5,
    output tri id_6,
    input tri1 id_7,
    output supply1 id_8,
    output tri1 id_9,
    output uwire id_10,
    input supply1 id_11,
    input wand id_12,
    input tri id_13,
    output wor id_14
);
  assign id_8 = 1;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd43
) (
    output tri0 id_0,
    input wor _id_1,
    input uwire id_2,
    input uwire id_3,
    input wire id_4,
    output wand id_5[-1 : id_1],
    input supply1 id_6,
    input supply1 id_7,
    input tri1 id_8,
    output uwire id_9,
    input uwire id_10
);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_10,
      id_6,
      id_6,
      id_0,
      id_10,
      id_0,
      id_9,
      id_0,
      id_3,
      id_3,
      id_10,
      id_9
  );
endmodule
