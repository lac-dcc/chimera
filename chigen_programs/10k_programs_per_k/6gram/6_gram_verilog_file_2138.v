// Seed: 2158706392
module module_0 (
    output wand id_0,
    input wire id_1,
    output tri0 id_2,
    output supply0 id_3,
    input tri1 id_4,
    input wor id_5
);
  assign id_2 = id_1;
  logic [7:0] id_7;
  assign id_7[1'd0] = id_1 & id_5;
  wire id_8 = id_5;
endmodule
module module_1 (
    input wor id_0,
    output tri0 id_1,
    input wor id_2,
    input uwire id_3,
    output tri1 id_4,
    output wor id_5,
    output supply0 id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_5,
      id_1,
      id_3,
      id_3
  );
  assign modCall_1.type_2 = 0;
endmodule
