// Seed: 1323179602
module module_0 (
    output supply1 id_0,
    output tri id_1,
    input supply0 id_2,
    output supply1 id_3,
    input wand id_4,
    input supply1 id_5,
    output supply0 id_6,
    output wor id_7,
    input tri1 id_8,
    input tri id_9,
    input wand id_10
);
  assign id_6 = 1;
  assign module_1.type_24 = 0;
  always_comb @(posedge id_9 - 1) id_3 = id_4;
  assign id_6 = 1;
endmodule
module module_1 (
    output tri id_0,
    output tri id_1,
    input supply1 id_2,
    output wire id_3,
    input supply0 id_4,
    input wire id_5,
    input tri1 id_6,
    input supply1 id_7,
    output tri1 id_8,
    output tri id_9
    , id_17,
    output wand id_10,
    output supply0 id_11,
    output wand id_12,
    output wor id_13,
    input uwire id_14,
    output uwire id_15
);
  wire id_18;
  module_0 modCall_1 (
      id_15,
      id_11,
      id_6,
      id_3,
      id_2,
      id_5,
      id_13,
      id_10,
      id_6,
      id_5,
      id_5
  );
  id_19(
      .id_0(id_10),
      .id_1(1 ? 1 : id_7),
      .id_2(),
      .id_3(id_6),
      .id_4(id_1),
      .id_5(id_9 << 1),
      .id_6(1'b0),
      .id_7(1),
      .id_8(id_4),
      .id_9(1),
      .id_10({1'b0, (1 + (id_13))})
  );
  always @(*);
endmodule
