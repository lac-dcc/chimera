// Seed: 3507546891
module module_0 (
    input tri1 id_0,
    output tri id_1,
    input supply1 id_2,
    output wor id_3,
    output wor id_4,
    input tri1 id_5
);
  id_7(
      .id_0(), .id_1(id_3), .id_2(1'b0), .id_3(id_0), .id_4(id_8 <-> id_8), .id_5(id_5), .id_6(id_4)
  );
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    output uwire id_2,
    input tri id_3,
    input tri id_4,
    output supply1 id_5,
    output wire id_6,
    input wire id_7,
    output uwire id_8,
    input wor id_9,
    input wor id_10,
    output uwire id_11,
    output uwire id_12,
    input tri id_13
);
  wand id_15, id_16 = id_4;
  nand primCall (id_2, id_7, id_4, id_16, id_0, id_13, id_10, id_15, id_9);
  module_0 modCall_1 (
      id_16,
      id_5,
      id_15,
      id_5,
      id_5,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
