// Seed: 3999321223
module module_0 (
    input tri1 id_0,
    output supply0 id_1,
    output tri1 id_2,
    input tri1 id_3,
    output wor id_4,
    input supply1 id_5,
    output wor id_6,
    input wire id_7
);
  assign id_4 = 1;
  module_2 modCall_1 (
      id_7,
      id_5
  );
  assign modCall_1.type_0 = 0;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output wire  id_1
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0
  );
endmodule
module module_2 (
    input wand id_0,
    input tri  id_1
);
  wire id_3;
  always @(1'b0) $display(id_0, 1);
endmodule
