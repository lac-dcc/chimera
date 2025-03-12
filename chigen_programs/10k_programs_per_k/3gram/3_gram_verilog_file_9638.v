// Seed: 3767435880
module module_0 (
    output supply0 id_0,
    output wand id_1,
    output wand id_2,
    input tri1 id_3,
    input wire id_4,
    input wor id_5,
    input wire id_6,
    input tri0 id_7,
    output supply1 id_8
);
  assign id_1 = id_6;
endmodule
module module_1 (
    output tri0 id_0,
    input  tri  id_1,
    output wor  id_2,
    input  tri  id_3
);
  wire  id_5;
  logic id_6;
  assign id_2 = -1;
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_5 = 0;
endmodule
module module_2 (
    output tri id_0,
    input  tri id_1
);
  logic id_3;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
