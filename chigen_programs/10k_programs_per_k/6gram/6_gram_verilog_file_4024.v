// Seed: 2018102902
module module_0 (
    input tri id_0,
    output tri1 id_1,
    input wor id_2,
    input wand id_3,
    output supply1 id_4
);
  wire id_6;
  assign module_2.id_1 = 0;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input  tri  id_0,
    input  tri  id_1,
    input  wand id_2,
    input  wire id_3,
    output tri1 id_4,
    output tri0 id_5,
    output wire id_6
);
  nand primCall (id_5, id_3, id_2, id_1, id_0);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_0,
      id_2,
      id_5
  );
  assign id_4 = 1;
endmodule
module module_2 (
    input tri1 id_0,
    output supply1 id_1,
    input tri0 id_2,
    output wor id_3,
    input uwire id_4,
    input wor id_5,
    input wor id_6
);
  always @(1) begin : LABEL_0
    force id_3 = id_6;
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_6,
      id_2,
      id_3
  );
endmodule
