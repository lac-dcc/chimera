// Seed: 3163913539
module module_0 (
    input supply0 id_0,
    output wor id_1,
    input supply1 id_2,
    input wor id_3,
    output supply0 module_0,
    input supply0 id_5,
    output wire id_6,
    output tri id_7,
    input wand id_8,
    input wand id_9,
    output wor id_10,
    input tri id_11,
    input supply0 id_12,
    output supply1 id_13,
    output tri id_14
    , id_20,
    output uwire id_15,
    output supply0 id_16,
    output uwire id_17,
    input supply0 id_18
);
  wire id_21 = !id_8;
  id_22(
      .id_0(id_9)
  );
  assign id_6 = 1'b0;
  wire id_23, id_24;
endmodule
module module_1 (
    output wor  id_0,
    output wire id_1,
    input  wire id_2
);
  tri0 id_4;
  wire id_5;
  id_6(
      .id_0(1),
      .id_1(id_2),
      .product(1),
      .id_2(1),
      .id_3({id_4 < {1 | id_0{id_2 == id_4}} {~id_2 == id_4}} - 1),
      .id_4(1),
      .id_5(id_5),
      .id_6({id_2 != id_1, id_5 == 1}),
      .id_7(id_2),
      .id_8(1),
      .id_9(id_2)
  ); module_0(
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2
  );
  wor id_7 = id_5;
  wire id_8;
  logic [7:0] id_9;
  assign id_9[1] = id_5 || 1;
endmodule
