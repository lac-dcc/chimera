// Seed: 3296415644
module module_0 (
    output supply0 id_0,
    input supply0 id_1,
    output uwire id_2,
    input supply1 id_3,
    input supply1 id_4,
    output wor id_5,
    input tri0 id_6
);
  wire id_8;
endmodule
module module_1 (
    input supply1 id_0,
    output tri1 id_1,
    input wire id_2,
    output tri0 id_3,
    input supply0 id_4,
    output wire id_5
);
  assign id_5 = 1'b0;
  assign id_3 = -1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_4,
      id_0,
      id_3,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    output tri0  id_0,
    output wand  id_1,
    input  tri0  id_2,
    input  wire  id_3,
    input  uwire id_4,
    input  tri0  id_5,
    output wand  id_6
);
  assign id_6 = id_5;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_6,
      id_2,
      id_5,
      id_0,
      id_5
  );
  assign modCall_1.id_0 = 0;
endmodule
