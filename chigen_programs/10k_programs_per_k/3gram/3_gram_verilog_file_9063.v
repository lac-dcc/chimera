// Seed: 181876645
module module_0 (
    output tri1 id_0,
    output tri0 id_1,
    input tri id_2,
    input uwire id_3,
    output wor id_4,
    input wire id_5,
    input uwire id_6,
    output supply1 id_7,
    output supply0 id_8,
    input supply1 id_9,
    input wor id_10,
    input supply0 id_11
);
  id_13(
      .id_0(id_5), .id_1(id_7), .id_2(1), .id_3(1), .id_4(1), .id_5(id_5)
  );
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1#(.id_9(1)),
    input supply1 id_2,
    input wor id_3,
    output tri id_4,
    output tri1 id_5,
    output supply1 id_6,
    output supply0 id_7
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_1,
      id_4,
      id_0,
      id_1,
      id_4,
      id_7,
      id_1,
      id_1,
      id_2
  );
endmodule
