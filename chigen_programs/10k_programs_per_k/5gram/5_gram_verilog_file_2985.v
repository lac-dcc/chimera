// Seed: 1073327941
module module_0 (
    input uwire id_0,
    input wor id_1,
    input wor id_2,
    input uwire id_3,
    input uwire id_4,
    output supply0 id_5,
    output tri module_0,
    input tri id_7,
    input uwire id_8,
    output uwire id_9,
    input tri id_10,
    output wand id_11
);
  assign id_9 = 1;
endmodule
module module_1 (
    output supply0 id_0,
    inout supply1 id_1,
    input supply0 module_1,
    input supply0 id_3,
    output wor id_4
);
  wire id_6;
  or primCall (id_1, id_3, id_7, id_6);
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_4,
      id_4,
      id_3,
      id_3,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
