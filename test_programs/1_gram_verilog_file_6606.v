// Seed: 3353745802
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input wor id_2,
    output wire id_3,
    input wand id_4,
    output tri id_5,
    output uwire id_6,
    input wand id_7,
    input supply1 id_8,
    output supply0 id_9
);
  wire id_11, id_12;
  assign id_3 = -id_2;
  assign module_1.id_1 = 0;
  supply1 id_13 = 1'b0 == id_4;
  wire id_14;
  assign id_3 = 1;
  wire id_15;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    input tri0 id_2,
    output tri0 id_3,
    input wor id_4,
    input tri1 id_5
);
  or primCall (id_1, id_0, id_2, id_4);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_3,
      id_4,
      id_2,
      id_1
  );
endmodule
