// Seed: 1727850008
module module_0 (
    input wire id_0,
    output supply1 id_1,
    output supply1 id_2,
    input supply0 id_3,
    output uwire id_4,
    input uwire id_5,
    input tri id_6
);
  id_8(
      .id_0(id_6),
      .id_1(id_0),
      .id_2(1),
      .id_3(1),
      .id_4(id_5),
      .id_5(""),
      .id_6(1),
      .id_7(id_3),
      .id_8(id_2),
      .id_9(id_1),
      .id_10(id_4),
      .id_11((1'b0)),
      .id_12(id_5)
  );
endmodule
module module_1 (
    output uwire id_0,
    output wand id_1,
    input supply0 id_2,
    output uwire id_3,
    input supply0 id_4,
    input supply1 id_5,
    input tri id_6,
    output tri id_7,
    input wire id_8,
    input wor id_9,
    output tri0 id_10,
    output wand id_11,
    input tri0 id_12,
    input wand id_13,
    input supply0 id_14
    , id_21,
    input supply0 id_15,
    inout supply0 id_16,
    input supply0 id_17,
    output wand id_18,
    input supply1 id_19
);
  id_22 :
  assert property (@(posedge id_12) id_19)
  else $display(1);
  module_0 modCall_1 (
      id_2,
      id_10,
      id_1,
      id_19,
      id_0,
      id_19,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
