// Seed: 549380166
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    output uwire id_2,
    output wire id_3
);
  assign id_2 = 1'b0;
endmodule
macromodule module_1 (
    input uwire id_0,
    input tri0 id_1,
    output tri id_2,
    input tri1 id_3,
    input tri id_4,
    input uwire id_5,
    input supply0 id_6
);
  wire id_8;
  wor  id_9 = id_5;
  nor primCall (id_2, id_3, id_10, id_8);
  wire id_10;
  module_0 modCall_1 (
      id_9,
      id_5,
      id_9,
      id_9
  );
endmodule
module module_2 (
    input tri0 id_0,
    input supply1 id_1,
    input tri id_2,
    output wor id_3,
    output wor id_4,
    input uwire id_5,
    input supply1 id_6,
    input tri1 id_7
    , id_15, id_16,
    input wor id_8,
    input supply0 id_9,
    output supply0 id_10,
    output supply0 id_11,
    input tri0 id_12,
    input tri0 id_13
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_10,
      id_10
  );
  assign modCall_1.type_0 = 0;
endmodule
