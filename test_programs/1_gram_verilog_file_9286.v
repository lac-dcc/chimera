// Seed: 1690555894
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    input tri id_2,
    output supply0 id_3,
    output wire id_4,
    output tri id_5,
    input tri id_6,
    output wand id_7,
    input wand id_8,
    input uwire id_9,
    input wire id_10,
    id_19,
    input supply0 id_11,
    input wire id_12,
    input uwire id_13,
    output supply1 id_14,
    input supply1 id_15,
    input wor id_16,
    output wor id_17
);
  int id_20 (
      1,
      1,
      id_1,
      id_13,
      id_13,
      id_12
  );
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input wire id_0,
    input tri1 id_1,
    input uwire id_2,
    input supply0 id_3,
    output uwire id_4
);
  id_6(
      .id_0(id_0), .id_1('h0 ? id_1 : -1), .id_2((1)), .id_3(1), .id_4(id_1)
  );
  module_0 modCall_1 (
      id_2,
      id_4,
      id_2,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_2,
      id_1,
      id_3,
      id_1,
      id_1,
      id_3,
      id_4,
      id_0,
      id_0,
      id_4
  );
  pullup id_7 (id_4);
endmodule
