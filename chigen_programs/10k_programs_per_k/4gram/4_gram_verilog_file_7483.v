// Seed: 922115523
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input wand id_2,
    output supply0 id_3
);
endmodule
module module_1 (
    input wor id_0,
    output tri id_1,
    output tri id_2,
    output wire id_3,
    output supply0 id_4,
    output tri id_5,
    input supply1 id_6
);
  id_8(
      .id_0(id_1++), .id_1(1), .id_2(1), .id_3(id_5), .id_4(id_5)
  );
  nor primCall (id_1, id_8, id_6);
  module_0 modCall_1 (
      id_6,
      id_0,
      id_6,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
