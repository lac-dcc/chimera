// Seed: 3721219199
module module_0 (
    output tri0  id_0,
    output wire  id_1,
    output wor   id_2,
    output tri0  id_3,
    input  tri1  id_4,
    input  wor   id_5,
    input  tri0  id_6,
    output uwire id_7,
    input  wire  id_8
);
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  supply1 id_0,
    input  supply0 id_1,
    output supply0 id_2,
    output supply0 id_3
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_3,
      id_2,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1
  );
  assign id_3 = 1;
endmodule
module module_2 (
    output uwire id_0,
    input uwire id_1,
    output wire id_2,
    output supply0 id_3,
    output wand id_4,
    output tri id_5,
    output wand id_6,
    output tri1 id_7,
    output uwire id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_8,
      id_1,
      id_1,
      id_1,
      id_4,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
