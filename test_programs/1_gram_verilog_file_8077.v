// Seed: 501184280
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = 1'h0;
  nand primCall (id_4, id_5, id_3, id_2);
  id_5(
      1, id_3
  );
  module_2 modCall_1 (id_4);
  assign modCall_1.id_3 = 0;
  assign module_1.id_1  = 0;
endmodule
module module_1 (
    output wire id_0,
    input tri1 id_1,
    input tri1 id_2,
    input wand id_3,
    id_6 = 1'b0,
    input supply1 id_4
);
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_6
  );
  assign id_0 = 1'b0;
endmodule
module module_2 (
    id_1
);
  inout wire id_1;
  tri id_2, id_3 = -1, id_4;
endmodule : SymbolIdentifier
