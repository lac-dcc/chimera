// Seed: 2086246062
module module_0 (
    input tri0 id_0,
    input tri id_1,
    output uwire id_2,
    output wor id_3,
    output uwire id_4,
    output wire id_5,
    input tri id_6,
    input wor id_7,
    input supply1 id_8
);
  assign id_4 = id_7;
  assign id_2 = -1;
  assign id_2 = -1'b0;
  assign id_2 = -1;
endmodule
module module_1 (
    input uwire id_0,
    input supply1 id_1,
    inout uwire id_2,
    input tri id_3,
    output wand id_4,
    input supply1 id_5
);
  wire id_7;
  or primCall (id_2, id_0, id_5, id_7, id_1, id_3);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.type_14 = 0;
endmodule
