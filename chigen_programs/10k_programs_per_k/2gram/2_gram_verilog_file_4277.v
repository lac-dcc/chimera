// Seed: 1575028762
module module_0 (
    input wand id_0,
    output wire id_1,
    output tri id_2,
    input supply1 id_3,
    input wand id_4,
    input supply0 id_5,
    input tri0 id_6,
    input supply1 id_7
);
  assign id_1 = ((id_0));
  assign module_1.id_5 = 0;
endmodule
macromodule module_1 (
    output wire id_0,
    output tri id_1,
    output supply1 id_2,
    output uwire id_3,
    input wor id_4,
    input tri id_5,
    input tri id_6,
    output tri0 id_7,
    output supply0 id_8,
    output uwire id_9,
    input wire id_10,
    input tri id_11,
    output uwire id_12,
    output tri0 id_13
);
  or primCall (id_8, id_15, id_11, id_6, id_10);
  parameter id_15 = 1;
  module_0 modCall_1 (
      id_6,
      id_2,
      id_12,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
