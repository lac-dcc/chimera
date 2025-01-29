// Seed: 3426724052
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input wire id_2,
    input wand id_3,
    input tri id_4,
    output uwire id_5,
    input uwire id_6,
    input wand id_7,
    output supply1 id_8,
    input supply1 id_9,
    output tri id_10,
    output uwire id_11,
    input tri0 id_12,
    input wire id_13,
    input tri1 id_14
);
  uwire id_16;
  assign id_11.id_3 = 1;
  id_17(
      id_13, id_11 < 1, 1, id_9, 1'b0, 1, id_5
  );
  assign id_16 = -1;
endmodule
module module_1 (
    output tri1 id_0,
    input wand id_1,
    input supply1 id_2
);
  tri1 id_4;
  id_5(
      id_0 & 1, id_1
  );
  assign id_0 = id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_4,
      id_2,
      id_1,
      id_4,
      id_2,
      id_4,
      id_0,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.type_4 = 0;
endmodule
