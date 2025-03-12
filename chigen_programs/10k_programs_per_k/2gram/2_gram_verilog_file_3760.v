// Seed: 1688494437
module module_0 (
    output wand id_0,
    input supply0 id_1
    , id_7,
    input wire id_2,
    input supply0 id_3,
    output tri id_4,
    input tri id_5
);
  logic id_8;
  wire  id_9;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output wire id_0,
    input tri1 id_1,
    input tri0 id_2,
    output supply1 id_3,
    input tri1 id_4,
    input wand id_5
);
  assign id_3 = id_5;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_2,
      id_1,
      id_0,
      id_2
  );
endmodule
module module_2 (
    input  tri0 id_0,
    output tri  id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
