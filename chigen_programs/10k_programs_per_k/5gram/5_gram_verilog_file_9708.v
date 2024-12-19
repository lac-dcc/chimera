// Seed: 4020817169
module module_0 (
    output wor  id_0,
    input  tri  id_1,
    output tri  id_2,
    output tri0 id_3,
    output tri  id_4,
    output tri1 id_5,
    input  tri1 id_6
);
  wire id_8 = 1, id_9;
  module_2 modCall_1 (id_8);
  assign modCall_1.id_2 = 0;
endmodule
module module_1 (
    input wire id_0,
    output wand id_1,
    output supply1 id_2,
    input wand id_3
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_2,
      id_2,
      id_1,
      id_3
  );
  assign modCall_1.type_4 = 0;
endmodule
module module_2 (
    id_1
);
  output wire id_1;
  reg id_2 = 1;
  initial begin : LABEL_0
    force id_1 = id_2;
  end
  final $display(id_2);
  assign id_2 = id_3 * 1 - 1;
  always @* begin : LABEL_0
    id_2 <= 1;
  end
endmodule
