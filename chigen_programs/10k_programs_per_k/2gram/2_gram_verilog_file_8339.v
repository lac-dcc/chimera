// Seed: 3021461006
module module_0 (
    input  wand id_0,
    output tri1 id_1,
    input  tri0 id_2,
    output tri0 id_3,
    output tri0 id_4,
    input  tri0 id_5,
    input  wor  id_6
);
endmodule
module module_1 (
    output wire id_0,
    input tri1 id_1,
    input wand id_2,
    output tri0 id_3,
    input supply1 id_4,
    output uwire id_5,
    input tri1 id_6,
    input supply1 id_7,
    input supply0 id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_5,
      id_5,
      id_7,
      id_6
  );
  assign modCall_1.id_1 = 0;
  wire id_11;
  nor primCall (id_0, id_2, id_8, id_7, id_4);
endmodule
