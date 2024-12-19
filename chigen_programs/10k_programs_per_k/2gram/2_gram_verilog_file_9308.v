// Seed: 749311036
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    output uwire id_2,
    input tri1 id_3,
    input wire id_4,
    input tri0 id_5,
    output uwire id_6,
    input wire id_7,
    input wor id_8,
    output tri0 id_9,
    input wand id_10
);
  id_12(
      .id_0(id_8), .id_1(1), .id_2(), .id_3(id_3)
  );
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    output supply1 id_2
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_2,
      id_0,
      id_1,
      id_1,
      id_2,
      id_0,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_10 = 0;
endmodule
