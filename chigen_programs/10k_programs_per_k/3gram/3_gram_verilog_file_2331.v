// Seed: 2589896158
module module_0 (
    output wand  id_0,
    output uwire id_1,
    input  tri   id_2,
    input  uwire id_3,
    output wand  id_4,
    input  tri1  id_5,
    input  tri0  id_6
);
  always @(*) $display(id_6, 1'b0);
  assign module_2.id_1 = 0;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    input supply0 id_2,
    inout tri0 id_3,
    input tri id_4,
    output wire id_5
);
  assign id_5 = 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_4
  );
endmodule
module module_2 (
    input  tri1  id_0,
    output uwire id_1,
    input  uwire id_2
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_2
  );
endmodule
