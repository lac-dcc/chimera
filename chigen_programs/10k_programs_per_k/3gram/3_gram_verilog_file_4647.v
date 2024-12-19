// Seed: 3037364851
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input tri1 id_2,
    output wand id_3,
    input tri0 id_4,
    output tri0 id_5,
    output wor id_6,
    output supply1 id_7
);
  logic [7:0] id_9;
  id_10(
      .id_0(id_1),
      .id_1(id_4 ** (id_9[1'b0])),
      .id_2(id_4),
      .id_3(1),
      .id_4(1'h0 | id_1),
      .id_5(),
      .id_6(id_0 + id_4),
      .id_7(1),
      .id_8(id_9)
  );
  wire id_11;
  wire id_12, id_13 = id_1;
endmodule
module module_1 (
    input tri1 id_0,
    input wire id_1,
    output wor id_2,
    input supply0 id_3,
    input wand id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2
  );
  wire id_7;
  not primCall (id_2, id_1);
endmodule
