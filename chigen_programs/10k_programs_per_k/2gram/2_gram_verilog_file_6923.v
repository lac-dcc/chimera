// Seed: 3410871175
module module_0 (
    output tri id_0,
    output tri0 id_1,
    input supply1 id_2,
    input wand id_3,
    output tri1 id_4,
    input wire id_5,
    input tri id_6,
    output tri0 id_7,
    output supply0 id_8
);
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    input wand id_2,
    input supply1 id_3,
    input tri id_4,
    input wor id_5,
    output tri1 id_6,
    input tri id_7
);
  assign id_6 = 1'b0;
  xnor primCall (id_6, id_7, id_0, id_4, id_2, id_5, id_1);
  module_0 modCall_1 (
      id_6,
      id_6,
      id_5,
      id_0,
      id_6,
      id_4,
      id_5,
      id_6,
      id_6
  );
  assign modCall_1.id_6 = 0;
endmodule
