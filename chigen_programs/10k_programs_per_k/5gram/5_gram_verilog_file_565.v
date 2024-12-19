// Seed: 1386711735
module module_0 (
    input wire id_0,
    input supply0 id_1,
    output tri0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    input wand id_5,
    input tri id_6,
    output supply0 id_7,
    input wor id_8,
    output wand id_9,
    inout supply1 id_10,
    output tri0 id_11,
    output uwire id_12,
    output wand id_13,
    input supply0 id_14,
    input tri id_15,
    output supply0 id_16,
    input wand id_17,
    input tri0 id_18,
    output tri1 id_19,
    output wire id_20
);
  integer id_22 (
      .id_0((id_19)),
      .id_1(1 & id_5),
      .id_2(id_7),
      .product(id_20),
      .id_3(1),
      .id_4((id_12)),
      .id_5(1),
      .id_6(1)
  );
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output wor   id_0,
    input  wand  id_1,
    input  wire  id_2,
    input  wor   id_3,
    output tri1  id_4,
    output wire  id_5,
    output uwire id_6,
    output wand  id_7
);
  wire id_9 = id_2;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_9,
      id_3,
      id_3,
      id_3,
      id_6,
      id_3,
      id_0,
      id_9,
      id_0,
      id_5,
      id_6,
      id_3,
      id_1,
      id_7,
      id_9,
      id_9,
      id_5,
      id_4
  );
endmodule
