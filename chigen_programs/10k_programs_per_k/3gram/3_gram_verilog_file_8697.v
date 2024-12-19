// Seed: 2393797663
module module_0 (
    input supply1 id_0,
    output tri id_1,
    output supply0 id_2,
    output tri id_3
);
  supply1 id_5 = (1);
endmodule
module module_1 (
    output supply1 id_0,
    input tri1 id_1,
    input wire id_2,
    output tri1 id_3,
    input tri id_4,
    input wand id_5,
    input supply0 id_6,
    input wand id_7,
    output wire id_8
);
  wire id_10;
  nand primCall (id_8, id_1, id_6, id_4, id_5, id_2, id_10, id_7);
  module_0 modCall_1 (
      id_6,
      id_0,
      id_3,
      id_8
  );
  assign modCall_1.type_1 = 0;
  wire id_11;
  assign id_0 = 1;
  wire id_12;
endmodule
