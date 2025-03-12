// Seed: 453359361
module module_0 (
    output tri1 id_0,
    output supply0 id_1,
    input wand id_2,
    input tri id_3,
    input wor id_4,
    input tri1 id_5,
    output supply1 id_6
);
endmodule
module module_1 (
    output tri1 id_0,
    input supply1 id_1,
    input wand id_2,
    input tri id_3,
    output wire id_4
);
  wire id_6;
  assign id_4 = id_6;
  wire id_7 = id_1;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_3,
      id_2,
      id_3,
      id_3,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    input  tri  id_0,
    input  tri  id_1,
    input  wire id_2,
    input  wand id_3,
    inout  tri0 id_4,
    output tri  id_5
);
  module_0 modCall_1 (
      id_4,
      id_5,
      id_2,
      id_1,
      id_0,
      id_3,
      id_4
  );
  assign modCall_1.id_5 = 0;
  and primCall (id_4, id_3, id_1, id_2, id_0);
endmodule
