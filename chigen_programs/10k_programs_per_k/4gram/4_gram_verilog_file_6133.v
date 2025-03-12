// Seed: 1668920463
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    output tri0 id_2,
    input wand id_3
);
endmodule
module module_1 (
    input  wand id_0,
    input  tri1 id_1,
    input  tri0 id_2,
    output tri0 id_3,
    input  tri0 id_4
);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input uwire id_0,
    input supply0 id_1,
    input wand id_2,
    input wire id_3,
    output wire id_4,
    input supply0 id_5
);
  logic id_7 = id_5;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
