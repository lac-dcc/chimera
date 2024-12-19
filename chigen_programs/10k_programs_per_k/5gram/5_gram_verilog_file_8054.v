// Seed: 1787000142
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_4;
  xnor primCall (id_1, id_2, id_3);
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4
  );
endmodule
module module_2 (
    input  tri0 id_0,
    input  tri0 id_1,
    output wor  id_2
);
  assign id_2 = !id_0 & id_1 == id_0;
endmodule
module module_3 (
    output tri1 id_0,
    input  wor  id_1
);
  wire id_3;
  module_2 modCall_1 (
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
