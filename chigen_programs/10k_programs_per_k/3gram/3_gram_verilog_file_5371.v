// Seed: 1494539636
module module_0 (
    input supply0 id_0,
    output wor id_1,
    input wire id_2,
    output supply0 id_3,
    output supply0 id_4,
    input wor id_5,
    input tri1 id_6
);
  wire id_8;
  assign module_1.type_0 = 0;
endmodule
macromodule module_1 (
    input wire id_0,
    output wire id_1,
    input wand id_2,
    output wand id_3,
    input wand id_4,
    output supply0 id_5,
    input tri id_6,
    output tri id_7,
    input tri0 id_8,
    output tri1 id_9,
    output tri1 id_10,
    output tri0 id_11,
    input wand id_12,
    output supply1 id_13,
    input tri id_14
);
  id_16(
      .id_0(1), .id_1(1'h0), .id_2(1), .id_3(~id_11), .id_4(1), .id_5(id_2)
  );
  xnor primCall (id_11, id_8, id_14, id_2, id_4, id_12, id_0, id_16, id_6);
  module_0 modCall_1 (
      id_6,
      id_10,
      id_14,
      id_5,
      id_1,
      id_2,
      id_8
  );
endmodule
