// Seed: 132258523
module module_0 (
    output supply0 id_0,
    input wor id_1,
    output wor id_2,
    input tri0 id_3,
    input supply0 id_4
);
  assign id_0 = id_3 ? 1 == id_3 : id_4 ? id_3 | id_4 : id_3;
  assign module_2.type_2 = 0;
endmodule
module module_1 (
    output wor id_0,
    input uwire id_1,
    input wor id_2,
    input uwire id_3,
    input uwire id_4,
    output tri id_5,
    input supply1 id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_5,
      id_1,
      id_6
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input supply0 id_0,
    output supply0 id_1,
    input wire id_2,
    output wire id_3
);
  wire id_5;
  and primCall (id_3, id_0, id_5, id_2);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_0,
      id_0
  );
endmodule
