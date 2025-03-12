// Seed: 2362110723
module module_0 (
    output wor id_0,
    input supply0 id_1,
    output tri module_0,
    input wor id_3,
    output supply1 id_4,
    input tri1 id_5,
    output uwire id_6
);
  assign id_2 = 1;
endmodule
module module_1 (
    input wire id_0,
    output tri id_1,
    input supply1 id_2,
    input wor id_3,
    output wire id_4
);
  assign id_4 = id_0;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_3,
      id_4,
      id_3,
      id_1
  );
  logic id_6;
  ;
  assign id_6 = id_2;
endmodule
module module_2 (
    input  wand id_0,
    input  tri  id_1,
    input  wand id_2,
    output tri1 id_3,
    input  tri1 id_4
);
  assign id_3 = id_0;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_4,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
