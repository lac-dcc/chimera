// Seed: 3852952354
module module_0 (
    input uwire id_0,
    input tri id_1,
    input supply1 id_2,
    input wor id_3,
    output wire id_4,
    input wand id_5
);
endmodule
module module_1 (
    output uwire id_0,
    input tri1 id_1,
    input supply1 id_2,
    output wand id_3,
    input tri1 id_4,
    output wor id_5,
    input uwire id_6,
    output supply1 id_7,
    output wand id_8,
    input wor id_9,
    output supply0 id_10,
    input wand id_11
);
  assign id_7 = 1;
  xnor primCall (id_0, id_11, id_1, id_9, id_14, id_13, id_6, id_15);
  always @(posedge id_6) id_13;
  wire id_14;
  wire id_15;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_4,
      id_4,
      id_10,
      id_4
  );
  assign modCall_1.type_7 = 0;
endmodule
