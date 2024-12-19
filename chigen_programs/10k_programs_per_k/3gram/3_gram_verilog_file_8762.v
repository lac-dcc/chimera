// Seed: 3679128240
macromodule module_0 (
    output supply0 id_0,
    input supply1 id_1,
    output wire id_2
);
  wire id_4;
endmodule
module module_1 (
    input tri id_0,
    input wor id_1,
    output tri0 id_2,
    input supply1 id_3,
    input wor id_4,
    input wor id_5,
    input supply1 id_6,
    input supply1 id_7,
    input uwire id_8,
    output wor id_9,
    output tri1 id_10
    , id_15,
    input wand id_11,
    input uwire id_12,
    output tri1 id_13
);
  id_16(
      .id_0(~id_11), .id_1(id_1), .id_2(id_6++), .id_3(1)
  );
  xnor primCall (id_2, id_0, id_5, id_3, id_11, id_8, id_1, id_16, id_12, id_6, id_7, id_4);
  module_0 modCall_1 (
      id_9,
      id_5,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
