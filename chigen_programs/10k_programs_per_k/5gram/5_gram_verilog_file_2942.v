// Seed: 1941862911
module module_0 (
    input supply1 id_0,
    output tri id_1,
    input uwire id_2,
    output tri1 id_3,
    input wand id_4,
    input uwire id_5,
    output wand id_6,
    input uwire id_7,
    input tri0 id_8,
    output tri0 id_9,
    output supply0 id_10,
    input wand id_11,
    input wire id_12,
    output supply0 id_13,
    output uwire id_14
);
endmodule
module module_1 #(
    parameter id_0 = 32'd15
) (
    input tri1 _id_0,
    output wor id_1,
    output tri id_2,
    input wand id_3,
    input supply1 id_4
);
  wire [1 : id_0  !=  -1 'd0] id_6, id_7, id_8;
  nor primCall (id_2, id_3, id_8, id_4, id_6, id_7);
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_1,
      id_4,
      id_4,
      id_2,
      id_4,
      id_3,
      id_2,
      id_1,
      id_3,
      id_3,
      id_1,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
