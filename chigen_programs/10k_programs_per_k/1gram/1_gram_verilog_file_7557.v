// Seed: 1035648526
module module_0 (
    id_1
);
  input wire id_1;
  id_2(
      .id_0(id_1)
  );
endmodule
module module_1;
  wire id_1, id_2;
  assign id_1 = id_2;
  module_0 modCall_1 (id_2);
  id_3(
      1 != id_1
  );
  assign id_3 = id_3;
  if (id_1) wire id_4;
  else wand id_5 = 1;
endmodule
module module_2 (
    input supply0 id_0,
    output wor id_1,
    input uwire id_2,
    output tri0 id_3,
    input supply0 id_4,
    input wor id_5,
    input tri1 id_6,
    input supply0 id_7,
    output wor id_8,
    output uwire id_9,
    output wire id_10,
    input uwire id_11,
    output tri id_12,
    output supply1 id_13,
    output tri id_14,
    output tri0 id_15,
    output tri id_16,
    input tri1 id_17
);
  assign id_12 = 1 - (1 || 1);
  assign id_9  = id_5;
  assign id_10 = id_7;
endmodule
macromodule module_3 (
    output uwire id_0,
    output wand id_1,
    input wire id_2,
    input supply0 id_3,
    output supply1 id_4,
    input tri id_5,
    output tri id_6,
    input supply1 id_7,
    input wire id_8
);
  module_2 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_0,
      id_5,
      id_3,
      id_5,
      id_8,
      id_0,
      id_0,
      id_4,
      id_5,
      id_0,
      id_1,
      id_1,
      id_0,
      id_6,
      id_8
  );
  assign modCall_1.type_24 = 0;
endmodule
