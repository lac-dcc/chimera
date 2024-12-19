// Seed: 1055214219
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    output supply1 id_2,
    input supply0 id_3,
    input wor id_4,
    input wor id_5,
    input wire id_6,
    input supply0 id_7,
    input wire id_8,
    output tri0 id_9,
    input tri0 id_10,
    input tri0 id_11,
    input tri id_12,
    output supply0 id_13,
    input wor id_14,
    output wor id_15,
    output supply1 id_16,
    output tri1 id_17
);
  assign id_2 = 1;
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    output wor id_2
);
  assign id_2 = id_1#(.id_1(1'b0)) != id_1 ? id_1 : 1 ? id_1.id_1("") : 1'b0 - 1;
  bufif1 primCall (id_2, id_1, id_5);
  wire id_4;
  tri0 id_5;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.id_16 = 0;
  uwire id_6 = ~id_6#(.id_1(1), .id_4(1)) && id_5 && id_5;
  wire  id_7;
endmodule
