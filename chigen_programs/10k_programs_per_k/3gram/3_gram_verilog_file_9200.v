// Seed: 4173348841
module module_0 (
    output tri0 id_0,
    output wire id_1,
    output supply0 id_2,
    input tri id_3,
    input wand id_4,
    output tri0 id_5,
    output uwire id_6,
    output tri0 id_7,
    input uwire id_8,
    output wand id_9,
    input supply0 id_10
);
  assign id_9 = 1;
  assign module_2.type_5 = 0;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input  tri1 id_0,
    input  wor  id_1,
    output tri0 id_2
);
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_0,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1
  );
endmodule
module module_2 (
    input supply1 id_0,
    input tri0 id_1,
    input wor id_2,
    output supply1 id_3,
    input uwire id_4,
    input wire id_5,
    input supply0 id_6
);
  assign id_3 = id_4;
  or primCall (id_3, id_0, id_2, id_1, id_6, id_4, id_5);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_2,
      id_5,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_0
  );
endmodule
