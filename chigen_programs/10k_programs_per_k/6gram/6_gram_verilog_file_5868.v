// Seed: 1648807152
module module_0 (
    output tri0 id_0,
    inout wor id_1
    , id_21,
    input supply0 id_2,
    output tri id_3,
    output tri id_4,
    input supply1 id_5,
    input supply0 id_6,
    input wire id_7,
    output wire id_8,
    input uwire id_9,
    output supply0 id_10,
    output wand id_11,
    input tri0 id_12,
    output wor id_13,
    input wire id_14,
    input tri0 id_15,
    output uwire id_16,
    output tri1 id_17,
    output tri1 id_18
    , id_22,
    output supply1 id_19
);
  integer id_23 (
      .id_0(1),
      .id_1(id_4),
      .id_2(1),
      .id_3(id_4),
      .id_4({1, id_4 == ~(id_12), id_22}),
      .id_5(id_0)
  );
  assign id_18 = id_1;
endmodule
module module_1 (
    output wor  id_0,
    input  wor  id_1,
    input  tri1 id_2,
    input  tri1 id_3,
    input  wire id_4,
    output tri  id_5,
    output tri0 id_6
);
  reg id_8;
  assign id_0 = id_1;
  supply0 id_9;
  assign id_6 = 1;
  wand id_10;
  initial
    if (1)
      if (id_4) deassign id_5;
      else if (id_8) id_8 <= id_2 - $display(id_4, 1, id_10, id_9);
  module_0 modCall_1 (
      id_10,
      id_10,
      id_4,
      id_9,
      id_9,
      id_2,
      id_1,
      id_1,
      id_10,
      id_1,
      id_0,
      id_0,
      id_2,
      id_0,
      id_9,
      id_3,
      id_5,
      id_5,
      id_5,
      id_6
  );
  assign modCall_1.id_9 = 0;
endmodule
