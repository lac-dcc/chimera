// Seed: 2598161615
module module_0 (
    input wor id_0,
    output tri1 id_1,
    input tri0 id_2,
    input wire id_3,
    output tri0 id_4,
    input tri id_5,
    input wand id_6,
    input wand id_7,
    input wor id_8,
    output supply1 id_9
);
endmodule
module module_1 (
    output wand id_0,
    input wand id_1,
    output supply0 id_2
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.type_14 = 0;
  wire id_4;
endmodule
module module_2 (
    input tri1 id_0,
    input uwire id_1,
    output supply1 id_2,
    input wor id_3,
    input wor id_4,
    output supply0 id_5,
    output tri id_6
);
  assign id_6 = id_1 - 1;
  wire id_8;
  logic [7:0] id_9;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_0,
      id_5,
      id_3,
      id_0,
      id_1,
      id_3,
      id_2
  );
  assign modCall_1.id_9 = 0;
  assign id_6 = id_9[1] == ~id_1;
endmodule
